set -gx PATH ~/.opam/system/bin $PATH
set -gx OCAML_TOPLEVEL_PATH ~/.opam/system/lib/toplevel
set -gx PERL5LIB ~/.opam/system/lib/perl5 $PERL5LIB
set -gx MANPATH $MANPATH ~/.opam/system/man
set -gx OPAMUTF8MSGS "1"
set -gx CAML_LD_LIBRARY_PATH ~/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs
