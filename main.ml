(* open Js_of_ocaml *)
open Game

(* js_of_ocaml helper declarations *)
module Html = Dom_html
let js = Js.string
let document = Html.document

(* [fail] is a failure/exception handler *)
let fail = fun _ -> assert false

(* [get_element_by_id id] gets a DOM element by its id *)
let get_element_by_id id =
  Js.Opt.get (Html.document##getElementById (js id)) fail

(* [append_text e s] appends string s to element e *)
let append_text e s = Dom.appendChild e (document##createTextNode (js s))

(* [main ()] is the main method of the entire game. *)
let main () = ()
  let gui = get_element_by_id "gui" in
  let h1 = Html.createH1 document in
  let p = Html.createP document in
  let audio = Html.createAudio document in
  audio##src <- js "music.mp3";
  audio##play ();
  append_text h1 "Caml-Break";
  (* append_text p "WOW!"; *)
  Dom.appendChild gui h1;
  Dom.appendChild gui p;
  let _ = Html.addEventListener document Html.Event.keydown (Html.handler Game.handle_keydown)
      Js._true in
  let canvas = Html.createCanvas document in
  canvas##width <- int_of_float Gui.canvas_width;
  canvas##height <- int_of_float Gui.canvas_height;
  Dom.appendChild gui canvas;
  let context = canvas##getContext (Html._2d_) in
  Game.game_loop context

(* start the game *)
let _ = main ()
