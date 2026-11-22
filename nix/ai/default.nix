{ ... }: {
  flake.nixosModules.ai = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pi-coding-agent
    ];
  };
}
