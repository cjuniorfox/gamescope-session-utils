{ stdenv, lib, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "gamescope-session-utils";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    make DESTDIR=$out install
    runHook postInstall
  '';

  meta = with lib; {
    description = "Custom Steam and Gamescope session utilities";
    homepage = "https://juniorfox.net";
    license = licenses.mit;  # Change if different
    platforms = platforms.linux;
    maintainers = with maintainers; [ ];
  };
}

