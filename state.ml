open Types
open Characters
open Room
open Items

let chest : treasurechest = {
  id = "chest";
  required_objects = {id= "skull"; item_type= Skull; x=0; y=0};
  contained_objects = {id= "key"; item_type= Key; x=0; y=0};
  speech = "There are strange skull carvings on this chest...";
  x= 16;
  y= 11;
}


let init_state = {
  items = items_list;
  characters = [init_player; officer; officer2; roomie; prisoner1; prisoner2; prisoner3];
  doors = door_list;
  beds = [];
  chests = [chest];
  shirt = { x = 12; y = 1; shown = false };
  toilet = (12, 1);
  curr_message = "**Hey! Buddy! Over Here!**";
  won = false;
  lost = false;
  room_objs = jail;
}


(* [get_chracter id st] takes a string id of a character and state, and returns
 * character object.
 * Raises "character not in state" if string does not correspond to any character
 *)
let get_character id (st : state) =
  let chr_list = (st.characters : character list) in
  let rec get_chr id1 (chrs : character list) =
    match chrs with
    | [] -> failwith "character not in state"
    | h::t -> if (h.id = id1) then h else get_chr id1 t in
  get_chr id chr_list

(* [get_player st] gets the playable player. *)
let get_player (st : state) =
   get_character "player" st

let can_move x y os =
  let rec check x' y' o =
    (match o with
    | [] -> true
    | h::t ->
      if ((float_of_int x') = fst h.location) && ((float_of_int y') = snd h.location) then
        match h.obj_type with
        (* You can walk through grass *)
        | Grass -> true
        | _ -> false
      else
        check x' y' t) in
  check x y os

(* [move_player character direction room obj list] moves the player according
   * to the I/O the game has received and decide whether or not the character
   * can actually move to that direction based on the location of the room objs. *)
let move_player (p : character) (d : direction) (objs : room_obj list) : character =
  match d with
  | Up -> let move = can_move p.x (p.y - 1) objs in
          if move then
          { p with oriented = North; x = p.x; y = (p.y - 1) }
          else
          { p with oriented = North; x = p.x; y = p.y }

  | Down -> let move = can_move p.x (p.y + 1) objs in
          if move then
          { p with oriented = South; x = p.x; y = (p.y + 1) }
          else
          { p with oriented = South; x = p.x; y = p.y }

  | Left -> let move = can_move (p.x - 1) p.y objs in
          if move then
          { p with oriented = West; x = (p.x - 1); y = p.y }
          else
          { p with oriented = West; x = p.x; y = p.y }

  | Right -> let move = can_move (p.x + 1) p.y objs in
          if move then
          { p with oriented = East; x = (p.x + 1); y = p.y }
          else
          { p with oriented = East; x = p.x; y = p.y }

(* [remove_invv item list int] removes an item from the inventory based on the
   * index number. *)
let rec remove_invv (inv : item list) (idx: int) : item list =
  match inv with
  | [] -> []
  | h::t -> if idx = 0 then empty_item::t else h::(remove_invv t (idx-1))

(* [remove_invv item list state] drops items from the inventory of the player.
  * acts as a helper function for drop_item*)
let rec drop_items (items: item list) (st: state) idx : item list =
  let inv = (List.hd st.characters).inv in
  let x_loc = (List.hd st.characters).x in
  let y_loc = (List.hd st.characters).y in
  let inv_item = List.nth inv (idx - 1) in
  {id= inv_item.id; item_type= inv_item.item_type; x= x_loc; y= y_loc}::items

(* [remove_invv item list state] drops items from the inventory of the player. *)
let drop_item st i : state =
let player = List.hd st.characters in
  let new_chr = { player with inv = (remove_invv (player.inv) (i-1)) } in
  let new_items = drop_items st.items st i in
  {st with characters = new_chr::(List.tl st.characters); items= new_items}

(* [move_leg character] enables the player to have animation by switching the leg
* every 20 loops in the game loop. *)
let move_leg (p : character) : character =
  {p with step = (p.step+1) mod 20}

(* [remove_item item list] replacing an item with an "empty_item"
   * therefore removing the item from the item list. *)
let rec remove_items (items : item list) id : item list =
match items with
| [] -> []
| h::t -> if h.id = id then empty_item::t else h::(remove_items t id)

(* [find_item item list] finds an item with from the item list. *)
let rec find_item (items : item list) id : item =
match items with
| [] -> empty_item
| h::t -> if h.id = id then h else find_item t id

(* [add_inv item list] adds an item to the inventory. *)
let rec add_inv (inv : item list) item =
match inv with
| [] -> inv
| h::t -> if h.id = "" then item::t else h::(add_inv t item)

(* [check_trade itemlist item] checks the requirements for a two-charcater trades
   * and switches the items in eachother's inventories. once a valid trade can be done. *)
let rec check_trade (inv : item list) (req : item) =
  match inv with
  | [] -> false
  | h::t -> if req.id = h.id then true else check_trade t req

(* [remove_char characterlist character] removes the character from the character list. *)
let rec remove_char (chrs : character list) (c : character) =
  match chrs with
  | [] -> []
  | h::t -> if h.id = c.id then t else h::(remove_char t c)

(* [step_talk character] enables the character to talk and print a message on the
   * messagebox based on the status of the character which is defined by its inventory. *)
let rec step_talk st (c : character) =
  let current_trade = List.hd c.trades in
  let trade_complete = check_trade ((get_player st).inv) current_trade.required in
  if trade_complete then
    let player_remove_inv = remove_items ((get_player st).inv) current_trade.required.id in
    let player_new_inv = add_inv player_remove_inv current_trade.offered in
    let new_player = { (List.hd st.characters) with inv = player_new_inv } in
    let char_remove_inv = remove_items (c.inv) current_trade.offered.id in
    let char_new_inv = add_inv char_remove_inv current_trade.required in
    let new_trades = List.tl c.trades in
    let new_char = { c with inv = char_new_inv; trades = new_trades } in
    let remove_chrs = remove_char st.characters c in
    let new_chrs = new_player::new_char::(List.tl remove_chrs) in
    { st with characters = new_chrs; curr_message = current_trade.speech }
  else { st with curr_message = current_trade.speech }

(* [can_unlock treasurechest itemlist] checks whether an item in the player's inventory
   * matches the requirements for opening the treasurechest. *)
let rec can_unlock (c: treasurechest) (inv : item list) : bool =
  match inv with
  | [] -> false
  | h::t -> if h.id = (c.required_objects.id) then true else (can_unlock c t)

(* [transfer_item itemlist] trades the items in two character's inventories
   once the transaction is verified.. *)
let rec transfer_item inv chest_item : item list =
  match inv with
  | [] -> []
  | h::t -> if h = empty_item then chest_item::t else h::(transfer_item t chest_item)

(* [unlock_help characterlist inv treasurechest] helper to step_unlock. it makes sure
* that only the plyaer can unlock the treasure chest*)
let rec unlock_help (characs: character list) inv (c:treasurechest) : character list=
  match characs with
  | [] -> []
  | h::t -> if h.id = "player" then { h with inv = (transfer_item inv c.contained_objects) }::t
    else failwith "no player"

(* [new_jail room obj list] transforms the closed treasurechest to an open one and make
* it visiable. *)
let rec new_jail (jail:room_obj list) =
  match jail with
  | [] -> []
  | h::t -> if h.obj_type = TreasureChest then {h with obj_type = TreasureChestOpen}::t
    else h::(new_jail t)

(* [get_chest string treasurechesstlist] pattern matches for a specific TreasureChest
  * from the list of treasurechests and gets the treasurechest.*)
let rec get_chest (c : string) (chests : treasurechest list) : treasurechest =
  match chests with
  | [] -> failwith "no chest"
  | h::t -> if h.id = c then h else get_chest c t

(* [get_chest string treasurechesstlist] pattern matches for a specific TreasureChest
  * from the list of treasurechests. Then removes that chest from the list. *)
let rec remove_chest (chests : treasurechest list) (c : treasurechest) =
  match chests with
  | [] -> []
  | h::t -> if (h.id = c.id) then t else h::(remove_chest t c)

(* [step_unlock state treasurechest] unlocks the treasure chest, replaces the sprite
   * to an open one, retrieves the item from the treasure and automatically puts it in
   * the player's inventory. *)
let step_unlock st (c: treasurechest) : state =
  let inv = (List.hd st.characters).inv in
  let new_chests = remove_chest st.chests c in
  let new_characters = unlock_help st.characters inv c in
  let new_room_objs = new_jail st.room_objs in
  if (can_unlock c inv) then
  let remove_key = remove_items ((List.hd new_characters).inv) c.required_objects.id in
  let final_chars = ({ (get_player st) with inv = remove_key })::new_characters in
  {st with characters = final_chars; room_objs= new_room_objs; chests = new_chests } else
    {st with curr_message = c.speech}

(* [step_grab state ] grabs the item that is infront of the player then adds the same
   * item to its own inventory. *)
let step_grab (state : state) id : state =
  let item_to_grab = find_item state.items id in
  let new_items = remove_items state.items id in
  let new_inv = add_inv (List.nth state.characters 0).inv item_to_grab in
  let new_player = { (List.nth state.characters 0) with inv = new_inv } in
  { state with characters = new_player::(List.tl state.characters);
               items = new_items }

(* [find_door string doorlist] finds the door based on the door_id from the list of doors. *)
let rec find_door (door_id: string) (door_list: door list) : door=
  match door_list with
  | [] -> failwith "no door"
  | h::t -> if h.id = door_id then h else find_door door_id t

(* [can_open  door itemlist] determines whether or not the door can be opened based on the items
   * in the player's inventory. and the door's requirement *)
let rec can_open (door: door) (inv : item list) : bool =
  match inv with
  | [] -> false
  | h::t -> if h.id = (door.required_objects.id) then true else (can_open door t)

(* [new_jail_d target room] finds whether the target is equal to any of the doors in Room.ml *)
let rec new_jail_d target room =
  match room with
  | [] -> []
  | h::t -> if (h.location = target) &&
               ((h.obj_type = DoorRight) || (h.obj_type = DoorLeft) || (h.obj_type = Door))
              then t else h::(new_jail_d target t)

(* [tgt_float target] converts the target from int to float. *)
let rec tgt_float target =
  match target with
  | (a,b) -> (float_of_int a, float_of_int b)

(* [open_door state string] opens the door based on the requirements and the player's inventory.
  * then removes the door from the room. *)
let open_door st door_id : state =
  let door = find_door door_id st.doors in
  let inv = (List.hd st.characters).inv in
  let player = List.nth st.characters 0 in
  let target =
    match player.oriented with
    | North -> (player.x, player.y - 1)
    | South -> (player.x, player.y + 1)
    | East -> (player.x + 1, player.y)
    | West -> (player.x - 1, player.y) in

  let target_flt = tgt_float target in
  let new_jail = new_jail_d target_flt st.room_objs in
  let new_inv = if (door.required_objects.id = "" || door.required_objects.id = "start_coins")
                then inv else remove_items inv door.required_objects.id in
  let new_player = { (List.nth st.characters 0) with inv = new_inv} in
  if (can_open door inv) && (door.id = "door3") then {st with won=true; room_objs= [];
                                                              characters= new_player::(List.tl st.characters)}
  else if (can_open door inv) then {st with room_objs= new_jail; characters= new_player::(List.tl st.characters)}
  else {st with curr_message = door.speech}

(* [step_change state] changes the clothes of the player once the player has picked up the
   * officer shirt as an item. *)
let step_change (state : state) =
  let new_player = { (get_player state) with hasChanged = true } in
  { state with characters = new_player::(List.tl state.characters);
               shirt = { x = 0; y = 0; shown = false;} }

(* [remove_toilet room_objlist x y] removes the toilet from the room. *)
let rec remove_toilet (objs : room_obj list) x y =
  match objs with
  | [] -> []
  | h::t -> if (fst (h.location) = x && snd (h.location) = y) then t else h::(remove_toilet t x y)

(* [find_hammer room_objlist x y] finds the hammer from the list of items
   * in the player's inventory. *)
let rec find_hammer (inv : item list) =
  match inv with
  | [] -> false
  | h::t -> if h.id = "hammer" then true else find_hammer t

(* [step_toilet state] enables the player to get the item (s)he needs from the toilet
 * if the player has the correct item in her/his inventory. it removes the required items
 * and simultaneously puts the item from the toilet into the inventory. *)
let step_toilet state =
  if (find_hammer ((get_player state).inv)) then
    let new_rooms = remove_toilet state.room_objs (float_of_int (fst state.toilet)) (float_of_int (snd state.toilet)) in
    let new_shirt = { state.shirt with shown = true; } in
    { state with room_objs = new_rooms; shirt = new_shirt }
  else state


(* [step_state state com] steps a state given a command. *)
let step_state (state : state) (com : player_action) =
  match com with
  | NoAction -> let step_leg = move_leg (get_player state) in
              let remove_player = List.tl state.characters in
              { state with characters = step_leg ::remove_player }
  | Reset -> { state with curr_message = ""; }
  | Move d -> let step_char = move_player (get_player state) d state.room_objs in
              let x_loc = step_char.x in let y_loc = step_char.y in
    let remove_player = List.tl state.characters in
    let is_changed = step_char.hasChanged in
    if (x_loc = 32) && (y_loc = 18) && not(is_changed) then { state with items= []; room_objs= []; lost= true;}
    else { state with characters = step_char::remove_player }

  | Interact i -> (match i with
                  | Toilet -> step_toilet state
                  | Talk c -> step_talk state (get_character c state)
                  | Open d -> open_door state d
                  | Sleep b -> state
                  | Grab i -> step_grab state i
                  | Change -> step_change state
                  | Unlock c -> step_unlock state (get_chest c state.chests))
  | Drop i -> drop_item state i
