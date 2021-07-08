with import <nixpkgs> { };

let
  pypacks = python-packages: with python-packages; [ fontforge ];
  pythonpack = python3.withPackages pypacks;
in stdenv.mkDerivation {
  name = "iosevka-build";

  buildInputs = [ nodejs ttfautohint pythonpack bc ];
}
