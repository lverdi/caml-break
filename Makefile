build:
	ocamlbuild -use-ocamlfind \
		-plugin-tag "package(js_of_ocaml.ocamlbuild)" \
		-no-links \
		main.d.js
	ocamlbuild -use-ocamlfind types.cmo state.cmo ai.cmo command.cmo gui.cmo game.cmo -r

clean:
	ocamlbuild -clean
