{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "openlibm";
  version = "0.8.4";

  src = fetchFromGitHub {
    owner = "JuliaLang";
    repo = "openlibm";
    rev = "v${version}";
    sha256 = "sha256-JhyF93XU2Yd6Ia+JtYvF7Dr+d90r6xMZj/fWDwCNeWY=";
  };

  makeFlags = [ "prefix=$(out)" "CC=${stdenv.cc.targetPrefix}cc" ];

  meta = {
    description = "High quality system independent, portable, open source libm implementation";
    homepage = "https://openlibm.org/";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.ttuegel ];
    platforms = lib.platforms.all;
  };
}
