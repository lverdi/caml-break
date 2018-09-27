open Ai
open Types


type command = Types.player_action

(* [find item x y lst is called finds the item based on location x y that is
   * in the list of items ] *)
let rec find_item x y (lst : item list) : item option =
  match lst with
  | [] -> None
  | h::t -> if (x = h.x && y = h.y) then Some h else find_item x y t

(* [find bed x y lst is called finds the bed based on location x y that is
   * in the list of beds ] *)
let rec find_bed x y (lst : bed list)  : bed option =
  match lst with
  | [] -> None
  | h::t -> if (x = h.x && y = h.y) then Some h else find_bed x y t

(* [find door x y lst is called finds the door based on location x y that is
   * in the list of door ] *)
let rec find_door x y (lst : door list) : door option =
  match lst with
  | [] -> None
  | h::t -> if (x = h.x && y = h.y) then Some h else find_door x y t

(* [find chest x y lst is called finds the chest based on location x y that
   * matches whatever is in the list of treasure chest lists ] *)
let rec find_chest x y (lst : treasurechest list) : treasurechest option =
  match lst with
  | [] -> None
  | h::t -> if (x = h.x && y = h.y) then Some h else find_chest x y t

(* [find char x y lst is called finds the character based on location x y that
   * matches whatever is in the list of character lists ] *)
let rec find_char x y (lst : character list) : character option =
  match lst with
  | [] -> None
  | h::t -> if (x = h.x && y = h.y) then Some h else find_char x y t

(* [determine_interaction st is called when the user presses the interact key 'P' on the keyboard.
 * This function finds the object, if any, that is directly in front of the space the
 player is currently on. It returns the appropriate command based on the type of this object.] *)
let determine_interaction st : command =
  let player = List.nth st.characters 0 in
  let target =
    match player.oriented with
    | North -> (player.x, player.y - 1)
    | South -> (player.x, player.y + 1)
    | East -> (player.x + 1, player.y)
    | West -> (player.x - 1, player.y) in
  if ((fst target) = st.shirt.x && (snd target) = st.shirt.y) && st.shirt.shown then
    Interact Change else
   if ((fst target) = (fst st.toilet) && (snd target) = (snd st.toilet)) then
    Interact Toilet else
  (match find_item (fst target) (snd target) st.items with
  | Some x ->  Interact (Grab x.id)
   | None ->
     (match find_bed (fst target) (snd target) st.beds with
     | Some x ->  Interact (Sleep x.id)
      | None ->
        (match find_chest (fst target) (snd target) st.chests with
        | Some x ->  Interact (Unlock x.id)
         | None ->
           (match find_char (fst target) (snd target) st.characters with
           | Some x ->  Interact (Talk x.id)
            | None ->
            (match find_door (fst target) (snd target) st.doors with
            | Some x ->  Interact (Open x.id)
             | None -> Reset)))))


let ai_cmd st id = ""
