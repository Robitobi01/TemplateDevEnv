{
  description = "NixOS-first Forge 1.12.2 development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux"; # Minecraft 1.12.2 ships x86-64 Linux natives.
    pkgs = import nixpkgs { inherit system; };
    nativeLibraries = with pkgs; [
      stdenv.cc.cc.lib
      libGL
      openal
      libpulseaudio
      alsa-lib
      libx11
      libxcursor
      libxext
      libxi
      libxrandr
      libxrender
      libxtst
      libxxf86vm
    ];
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [ pkgs.jdk25 pkgs.git ];
      JAVA_HOME = "${pkgs.jdk25}/lib/openjdk";
      JDK8_HOME = "${pkgs.jdk8}/lib/openjdk";

      # LWJGL 2 loads these libraries dynamically. Use the host's GPU drivers,
      # not a pinned Mesa driver that may disagree with the running kernel.
      shellHook = ''
        export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath nativeLibraries}:/run/opengl-driver/lib''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
      '';
    };
  };
}
