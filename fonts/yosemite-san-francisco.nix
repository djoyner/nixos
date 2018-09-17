{ stdenv, fetchzip }:

let
  version = "master";
in fetchzip rec {
  name = "yosemite-san-francisco";

  url = "https://github.com/supermarin/YosemiteSanFranciscoFont/archive/${version}.zip";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';

  #sha256 = "747ad7b28092c4dbd2f1531f3bf7f270ba4a7983313cb426d9a9fb4f25a74beb";
  sha256 = "1k9yg5rfqnmmrc09kmmpxxdg0fxflv4ahb93n2wvfqx29icrw338";

  meta = {
    homepage = https://github.com/supermarin/YosemiteSanFranciscoFont;
    description = "Yosemite San Francisco Font";
    longDescription = ''
      The font is adapted from San Francisco – Apple’s new typeface for
      the Apple Watch.
    '';
    license = stdenv.lib.licenses.free;
    platforms = stdenv.lib.platforms.all;
  };
}
