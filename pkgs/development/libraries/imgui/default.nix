{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "imgui";
  version = "1.89.2";

  src = fetchFromGitHub {
    owner = "ocornut";
    repo = "imgui";
    rev = "v${version}";
    sha256 = "sha256-NJRDVNnOCJ0lfxSXxzVpSo2m6DCppgdoRRGDYoRcajs=";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/include/imgui

    cp *.h $out/include/imgui
    cp *.cpp $out/include/imgui
    cp -a backends $out/include/imgui/
    cp -a misc $out/include/imgui/
  '';

  meta = with lib; {
    description = "Bloat-free Graphical User interface for C++ with minimal dependencies";
    homepage = "https://github.com/ocornut/imgui";
    license = licenses.mit;
    maintainers = with maintainers; [ wolfangaukang ];
    platforms = platforms.all;
  };
}
