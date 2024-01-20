{
  trzpiot = {
    home-manager.enable = true;
    homebrew.enable = true;
    nix.enable = true;

    users = {
      enable = true;

      users = [
        {
          username = "strzpiot";
          name = "Sebastian Gabriel Trzpiot";
          email = "dev@trzpiot.de";
          uid = 501;
          shell = "fish";
        }
      ];
    };
  };

  system.stateVersion = 4;
}
