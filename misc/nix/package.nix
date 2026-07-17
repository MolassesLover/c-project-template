{ llvmPackages, cmake, ninja, musl }:

llvmPackages.stdenv.mkDerivation (finalAttrs: {
  pname = "program";
  version = "1.0.0";

  src = ../../.;

  nativeBuildInputs = [ musl llvmPackages.clang cmake ninja ];
})
  