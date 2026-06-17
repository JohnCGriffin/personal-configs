
. ~/.opam/opam-init/init.sh

echo . ~/.opam/opam-init/init.sh >> ~/.bashrc

opam install -y dune
opam install -y bitv
opam install -y curses

