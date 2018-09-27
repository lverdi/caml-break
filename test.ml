open OUnit2
open Types
open State
open Command

let c = {
  id = "Jon";
  speech= "";
  x = 2;
  y = 2;
  inv = [];
  oriented = North;
}

let i = {
  id = "key";
  interact_type = Item;
  x = 2;
  y = 3;
}

let s = {
  items = ["key"];
  characters = [c];
  curr_locations =  [i];
  won = false;
}

let x = determine_interaction s

let tests =
  [
    "init" >:: (fun _ -> assert_equal (Interact (Grab "key")) (x));

  ]


let suite =
  "Game test suite"
  >::: tests

let _ = run_test_tt_main suite
