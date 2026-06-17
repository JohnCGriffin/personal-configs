
. ~/.opam/opam-init/init.sh

echo . ~/.opam/opam-init/init.sh >> ~/.bashrc

opam switch create jcgdebian 5.3.0
opam switch set jcgdebian

opam install -y dune
opam install -y bitv
opam install -y curses
opam install -y ocamlformat
opam install -y ocaml-lsp-server

opam install -y alcotest 
opam install -y qcheck
opam install -y qcheck-alcotest
opam install -y uutf
opam install -y utop

