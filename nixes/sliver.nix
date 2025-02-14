{
  autoPatchelfHook,
  fetchurl,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation rec {
  pname = "sliver";
  version = "1.5.42";

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  srcs = [
    (fetchurl {
      url = "https://github.com/BishopFox/sliver/releases/download/v${version}/sliver-client_linux";
      sha256 = "sha256-xTvBMXC5/yawzKk3FelHMY4Gyv4NmM+CXqv/48f3Y8s=";
      name = "client";
    })
    (fetchurl {
      url = "https://github.com/BishopFox/sliver/releases/download/v${version}/sliver-server_linux";
      sha256 = "sha256-LOarLUjWE4MPLNeSDO2Gyntngtuv5kr4S6R29x0IYg4=";
      name = "server";
    })
  ];

  dontBuild = true;

  unpackPhase = ''
    for _src in $srcs; do
      cp "$_src" $(stripHash "$_src")
    done
  '';

  installPhase = ''
    mkdir -p $out/bin

    cp server $out/bin/sliver-server
    chmod +x $out/bin/sliver-server

    cp client $out/bin/sliver-client
    chmod +x $out/bin/sliver-client
  '';
}
