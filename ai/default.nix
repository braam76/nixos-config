{ self, ... }: {
  flake.nixosModules.ai = { pkgs, ... }: {
    imports = [ self.nixosModules.pi-code ];
    environment.systemPackages = [ pkgs.opencode ];
  };
}
