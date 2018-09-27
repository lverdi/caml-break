open Types

(* canvas width and height *)
let canvas_width = 1500.
let canvas_height = 500.
let pixel_scale = 25.

(* js_of_ocaml helper declarations *)
module Html = Dom_html
let js = Js.string
let document = Html.document

(* [get_src_obj obj pattern matches the room object type then outputs
  * the sprites that matches the room object.] *)
let get_src_obj (obj: room_obj) =
  match obj.obj_type with
  | Wall -> js "sprites/wall.png"
  | Floor -> js "sprites/floor.png"
  | Bed -> js "sprites/bed.png"
  | Bench -> js "sprites/bench.png"
  | Door -> js "sprites/door.png"
  | DoorLeft -> js "sprites/door_left.png"
  | DoorRight -> js "sprites/door_right.png"
  | Skull -> js "sprites/skull.png"
  | Table -> js "sprites/table.jpg"
  | TreasureChest -> js "sprites/treasurechest_closed.png"
  | TreasureChestOpen -> js "sprites/treasurechest_open.png"
  | Grass -> js "sprites/grass.png"
  | GrassUnwalkable -> js "sprites/grass.png"
  | CharacterNorth -> js "sprites/player_back.png"
  | CharacterSouth -> js "sprites/player_front.png"
  | CharacterEast -> js "sprites/player_right.png"
  | CharacterWest -> js "sprites/player_left.png"
  | OfficerNorth -> js "sprites/officer_back_walk1.png"
  | OfficerSouth -> js "sprites/officer_front_walk1.png"
  | OfficerEast -> js "sprites/officer_right_walk1.png"
  | OfficerWest -> js "sprites/officer_left_walk1.png"
  | PrisonerNorth -> js "sprites/prisoner_back_walk1.png"
  | PrisonerSouth -> js "sprites/prisoner_front_walk1.png"
  | PrisonerEast -> js "sprites/prisoner_right_walk1.png"
  | PrisonerWest -> js "sprites/prisoner_left_walk1.png"
  | Toilet -> js "sprites/toilet.png"
  | None -> js ""

(* [get_src_item item pattern matches the object type then outputs
  * the sprites that matches the item.] *)
let get_src_item (obj: item) =
  match obj.item_type with
  | Axe -> js "sprites/axe.png"
  | Apple -> js "sprites/apple.png"
  | Book -> js "sprites/book.png"
  | Caml -> js "sprites/caml.png"
  | Coin -> js "sprites/coin.png"
  | Hammer -> js "sprites/hammer.png"
  | Journal -> js "sprites/journal.png"
  | Key -> js "sprites/key1.png"
  | Knife -> js "sprites/knife.png"
  | Letter -> js "sprites/letter.png"
  | Mirror -> js "sprites/mirror.png"
  | Poison -> js "sprites/poison.png"
  | Rod -> js "sprites/rod.png"
  | Shovel -> js "sprites/shovel.png"
  | Skull -> js "sprites/skull.png"
  | Cup -> js "sprites/cup.png"
  | Clover -> js "sprites/fourleafclover.png"
  | None -> js ""

(* [clear canvas] clears the canvas of all drawing. *)
let clear (context: Html.canvasRenderingContext2D Js.t) =
  context##clearRect (0., 0., canvas_width, canvas_height)

(* [draw_object context loc obj] draws a single object obj in context at loc *)
let draw_object (context: Html.canvasRenderingContext2D Js.t) (l: location) (obj: room_obj) =
  let src = get_src_obj obj in
  let img = Html.createImg document in
  img##src <- src;
  context##drawImage ((img), (fst l *. pixel_scale), (snd l *. pixel_scale))

(* [draw_room_objects context room_obj list] draws all of the basic map objects
   in the current room given by the [room_id]. *)
let draw_room_objects (context: Html.canvasRenderingContext2D Js.t) (room_objs: room_obj list) =
  List.map (fun o -> draw_object context o.location o) room_objs |> ignore

(* [draw_room2 context room_obj list] draws the GAME OVER window once the player loses the game. *)
let draw_room2 (context: Html.canvasRenderingContext2D Js.t) (room_objs: room_obj list) =
  context##fillStyle <- js "rgb(0, 0, 0)";
  context##fillRect (0., 0., 900., 500.);
  context##fillStyle <- js "white";
  context##font <- js "30px 'Press Start 2P'";
  context##fillText ((js "GAME OVER"), 330., 230.);
  context##font <- js "15px 'Press Start 2P'";
  context##fillText ((js "You were caught wearing your orange suit..."), 150., 300.);
  draw_room_objects context room_objs

(* [draw_room1 context room_obj list] draws the window once the player wins the game. *)
let draw_room1 (context: Html.canvasRenderingContext2D Js.t) (room_objs: room_obj list) =
context##fillStyle <- js "rgb(0, 0, 0)";
context##fillRect (0., 0., 900., 500.);
context##fillStyle <- js "white";
context##font <- js "20px 'Press Start 2P'";
context##fillText ((js "You have broken out of prison!"), 200., 250.);
draw_room_objects context room_objs

(* [draw_room context room_obj list] draws the main room of the game.
 * this also includes the inventory and the message boxes and the additional
  * instructions on the right side. *)
let draw_room (context: Html.canvasRenderingContext2D Js.t) (room_objs: room_obj list) =
  context##fillStyle <- js "rgb(92, 66, 39)";
  context##fillRect (0., 0., 900., 500.);
  (*TEXT BOX*)
  context##fillStyle <- js "rgb(176, 196, 222)";
  context##fillRect (930., 0., 200., 150.);
  (*INVENTORY BOXES*)
  context##font <- js "13px 'Press Start 2P'";
  context##fillStyle <- js "black";
  context##fillText ((js "Inventory : "), 920., 190.);
  context##fillStyle <- js "rgb(200, 200, 200)";
  context##fillRect (935., 200., 30., 30.);
  context##fillRect (975., 200., 30., 30.);
  context##fillRect (1015., 200., 30., 30.);
  context##fillRect (1055., 200., 30., 30.);
  context##fillRect (1095., 200., 30., 30.);
  (*NUMBER UNDER INVENTORY BOXES*)
  context##font <- js "7px 'Press Start 2P'";
  context##fillStyle <- js "black";
  context##fillText ((js "1"), 942., 250.);
  context##fillText ((js "2"), 982., 250.);
  context##fillText ((js "3"), 1022., 250.);
  context##fillText ((js "4"), 1062., 250.);
  context##fillText ((js "5"), 1102., 250.);
  context##font <- js "11px 'Press Start 2P'";
  context##fillText ((js "Type index to drop item"), 920., 300.);
  context##fillText ((js "Stand infront & press 'P'"), 920., 370.);
  context##font <- js "12px 'Press Start 2P'";
  context##fillText ((js "To grab item or talk,"), 920., 350.);

  draw_room_objects context room_objs

(* [draw_item context item] draws individual items onto the room. It is used as a
  * helper function for draw_items. *)
let draw_item (context: Html.canvasRenderingContext2D Js.t) (item: item) =
    let src = get_src_item item in
    let img = Html.createImg document in
    img##src <- src;
    context##drawImage ((img), ((float_of_int item.x) *. pixel_scale), ((float_of_int item.y) *. pixel_scale))

(* [draw_items context item list] draws all items onto the room that are in the state. *)
let draw_items (context: Html.canvasRenderingContext2D Js.t) (items: item list) =
  List.map (fun o -> draw_item context o) items |> ignore

(* [draw_inventory context item list] draws the items that were picked up to the inventory boxes. *)
let rec draw_inventory (context: Html.canvasRenderingContext2D Js.t) (inv: item list) idx =
  let inventory_index = [938.; 978.; 1018.; 1058.; 1097.] in
  match inv with
  | [] -> ()
  | h::t -> match h.id with
            | "" -> draw_inventory context t (idx + 1)
            | _ ->
              let src = get_src_item h in
              let img = Html.createImg document in
              img##src <- src;
              context##drawImage ((img), (List.nth inventory_index idx), 202.);
              draw_inventory context t (idx + 1)

(* [print_lines context string list float] prints lines on the message box so that it wraps around
   * and does not go beyond the borders of the message box. this acts as a helper function for line_list. *)
let rec print_lines (context: Html.canvasRenderingContext2D Js.t) (lines : string list) (i : float) =
  match lines with
  | [] -> ()
  | h::t -> context##fillText ((js h), 935., (35. +. i)); print_lines context t (i +. 17.)

(* [print_lines string list] prints lines on the message box so that it wraps around
   * and does not go beyond the borders of the message box. *)
let rec line_list words (lines : string list) : string list =
  let last = List.hd (List.rev lines) in
  match words with
  | [] -> lines
  | h::t -> if ((String.length (List.hd words)) + String.length last) <= 17 then
              let updated_last = last ^ (List.hd words) ^ " " in
              line_list t (List.rev (updated_last::(List.tl (List.rev lines))))
            else line_list words (lines @ [""])

(* [draw_messages string ] prints the message on the message box. *)
let draw_messages (context: Html.canvasRenderingContext2D Js.t) (msg: string) =
  context##font <- js "10px 'Press Start 2P'";
  context##fillStyle <- js "black";
  let word_list = String.split_on_char ' ' msg in
    print_lines context (line_list word_list [""]) 0.0

(* [draw_character_helper] acts as a helper function for draw_character.
 * it decides whether or not the character has picked up the officer clothes. *)
let draw_character_helper (charac: character) =
  match charac.hasChanged with
  | true ->
    if charac.step > 10 then
      (match charac.oriented with
      | North -> js "sprites/officer_back_walk1.png"
      | South -> js "sprites/officer_front_walk1.png"
      | West -> js "sprites/officer_left_walk1.png"
      | East -> js "sprites/officer_right_walk1.png")
    else
      (match charac.oriented with
       | North -> js "sprites/officer_back_walk2.png"
       | South -> js "sprites/officer_front_walk2.png"
       | West -> js "sprites/officer_left_walk2.png"
       | East -> js "sprites/officer_right_walk2.png")
  | false ->
    if charac.step > 10 then
      (match charac.oriented with
      | North -> js "sprites/player_back.png"
      | South -> js "sprites/player_front.png"
      | West -> js "sprites/player_left.png"
      | East -> js "sprites/player_right.png")
    else
      (match charac.oriented with
       | North -> js "sprites/player_back_walk2.png"
       | South -> js "sprites/player_front_walk2.png"
       | West -> js "sprites/player_left_walk2.png"
       | East -> js "sprites/player_right_walk2.png")

(* [draw_plyer context state] draws the player to the game based on the state. *)
let draw_player (context: Html.canvasRenderingContext2D Js.t) (state : state) =
  let img = Html.createImg document in
  let p = List.hd state.characters in
  let src = draw_character_helper p in
  let locationx = (float_of_int p.x) *. pixel_scale in
  let locationy = (float_of_int p.y) *. pixel_scale in
  img ##src <- src;
  context##drawImage ((img), (locationx), (locationy))

(* [draw_shirt context state] draws the blue officer's shirt onto the screen. *)
let draw_shirt (context: Html.canvasRenderingContext2D Js.t) (state : state) =
  if state.shirt.shown then
    let img = Html.createImg document in
    let locationx = (float_of_int state.shirt.x) *. pixel_scale in
    let locationy = (float_of_int state.shirt.y) *. pixel_scale in
    if locationx = 0.0 then () else
    img##src <- js "sprites/tshirt.png";
    context##drawImage ((img), (locationx), (locationy)) else ()

(* [draw_state context state] acts as a main function of this file and it is responsible
   * for drawing everything that should be visible on state such as characters, room_obj and items. *)
let draw_state (context: Html.canvasRenderingContext2D Js.t) (state : state) =
   clear context;
   if state.won = true then draw_room1 context state.room_objs else if
     state.lost = true then draw_room2 context state.room_objs else
    ( draw_room context state.room_objs;
  draw_messages context state.curr_message;
  (* draw_characters context state.characters; *)
  draw_player context state;
  draw_inventory context ((List.hd state.characters).inv) 0;
  draw_items context state.items;
      draw_shirt context state)
