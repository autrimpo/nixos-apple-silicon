{ stdenv
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "triforce";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "chadmed";
    repo = "triforce";
    rev = version;
    hash = "sha256-Rv4FHDmmTELYwrxfWDt/TghspLQBGgiREaq3KV98EQY=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-ltrvwvrzRPtgB4y/TeIHhIQdWAfo2NHTeDYvDqTuPXE=";

  installPhase = ''
    export LIBDIR=$out/lib
    mkdir -p $LIBDIR

    make
    make install
  '';
}
