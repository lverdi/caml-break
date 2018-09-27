open Js_of_ocaml
open Types
open State

module Html = Dom_html
let js = Js.string
let document = Html.document

let current_state = ref (State.init_state)

(* [handle_keydown key pattern matches to the keyboard I/O then matches
  * that to the corresponding action in the game the user wants to perform.] *)
let handle_keydown key =
  let () = match key##keyCode with
    | 87 -> current_state := (State.step_state !current_state (Move Up))
    | 65 -> current_state := (State.step_state !current_state (Move Left))
    | 68 -> current_state := (State.step_state !current_state (Move Right))
    | 83 -> current_state := (State.step_state !current_state (Move Down))
    | 80 -> current_state := (State.step_state !current_state (Command.determine_interaction !current_state))
    (* Drop keys 1-6*)
    | 49 -> current_state := (State.step_state !current_state (Drop 1))
    | 50 -> current_state := (State.step_state !current_state (Drop 2))
    | 51 -> current_state := (State.step_state !current_state (Drop 3))
    | 52 -> current_state := (State.step_state !current_state (Drop 4))
    | 53 -> current_state := (State.step_state !current_state (Drop 5))
    | 54 -> current_state := (State.step_state !current_state (Drop 6))
    | _ -> ()
  in Js._true

(* [game_loop context initializes the loop for continuous updates of GUI.] *)
let game_loop context =
  let rec game_loop_helper () =
    current_state := State.step_state !current_state (NoAction);
    Gui.draw_state context !current_state;
    Html.window##requestAnimationFrame(
      Js.wrap_callback (fun (t:float) -> game_loop_helper ())
    ) |> ignore
  in game_loop_helper ()
