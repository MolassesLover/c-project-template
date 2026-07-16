{ stdenv, clang, cmake, ninja, musl }:

stdenv.mkDerivation (finalAttrs: {
  pname = "program";
  version = "1.0.0";

  src = ../../.;

  nativeBuildInputs = [ musl clang cmake ninja ];
})
