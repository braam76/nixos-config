{ ... }: {
  flake.nixosModules.ai = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      opencode
      pi-coding-agent
      herdr
    ];
  };
}
