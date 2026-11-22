{ ... }: {
  flake.nixosModules.games = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      mindustry
    ];
  };
}
