open Js_of_ocaml

(* [handle_keydown] registers a key press. *)
val handle_keydown : Dom_html.keyboardEvent Js.t -> bool Js.t

val game_loop: Dom_html.canvasRenderingContext2D Js.t -> unit
