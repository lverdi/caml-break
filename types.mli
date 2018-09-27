type orientation = North | South | West | East

type item_type = Caml | Key | Knife | Axe | Book | Coin | Hammer | Journal | Letter
               | Mirror | Poison | Rod | Shovel | Skull | Apple | Cup | Clover | None

type direction = Up | Down | Left | Right

type interact_type = Door | Character | Item | Bed | TreasureChest

type location = float * float

type room_obj_type = Wall | Floor | Bed | Bench | Door | DoorLeft | DoorRight | Skull | Table
                   | TreasureChest | TreasureChestOpen | Grass | GrassUnwalkable | CharacterNorth
                   | CharacterSouth | CharacterEast | CharacterWest | OfficerNorth
                   | OfficerSouth | OfficerEast | OfficerWest | PrisonerNorth
                   | PrisonerSouth | PrisonerEast | PrisonerWest | Toilet | None

(* [obj] is the type of items that can be added to the inventory of the player *)
type room_obj = {
  location: location;
  obj_type: room_obj_type;
}

type item = {
  id: string;
  item_type: item_type;
  x: int;
  y: int;
}

type trade = {
  speech : string;
  required : item;
  offered : item;
}

(* [character] is the type of the characters the player can interact with in
   the game, and the player as well *)
type character = {
  id: string;
  trades: trade list;
  hasChanged: bool;
  x : int;
  y : int;
  inv: item list;
  oriented : orientation;
  step : int;
}

(* [door] is the type of a door. It can either be open or closed. [required_objects]
   is a list of obj that are needed to enter the room *)
type door = {
  id : string;
  required_objects : item;
  speech: string;
  x: int;
  y: int;
}

type bed = {
  id : string;
  x: int;
  y: int;
}

type shirt = {
  x: int;
  y: int;
  shown: bool;
}


type treasurechest = {
  id : string;
  required_objects: item;
  contained_objects: item;
  speech: string;
  x: int;
  y: int;
}


(* [state] is the state of the game *)
type state = {
  items: item list;
  characters: character list;
  doors: door list;
  beds: bed list;
  chests: treasurechest list;
  shirt : shirt;
  toilet : int * int;
  curr_message: string;
  won: bool;
  lost: bool;
  room_objs: room_obj list;
}

type interaction = Talk of string | Open of string | Sleep of string | Grab of string
                 | Unlock of string | Change | Toilet

type player_action = Move of direction | Interact of interaction | Drop of int
                   | NoAction | Reset
