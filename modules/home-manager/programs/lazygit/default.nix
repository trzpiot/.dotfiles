{
  programs.lazygit = {
    enable = true;

    settings = {
      git.paging = { pager = "delta --syntax-theme 'Dracula' --paging=never"; };
    };
  };
}
