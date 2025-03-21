{ lib
, fetchFromGitHub
, alsa-ucm-conf }:

(alsa-ucm-conf.overrideAttrs (oldAttrs: rec {
  version = "7";

  src_asahi = fetchFromGitHub {
    # tracking: https://src.fedoraproject.org/rpms/alsa-ucm-asahi
    owner = "AsahiLinux";
    repo = "alsa-ucm-conf-asahi";
    rev = "v${version}";
    hash = "sha256-CT2YIJoR7fUvDajYqO8LvbLo9S4C12CUCqGTnkiiS5o=";
  };
  
  postInstall = oldAttrs.postInstall or "" + ''
    cp -r ${src_asahi}/ucm2 $out/share/alsa
  '';
}))
