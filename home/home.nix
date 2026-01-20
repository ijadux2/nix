{
  pkgs,
  ...
}:

{
  home.username = "jadu";
  home.homeDirectory = "/home/jadu";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    # Flutter environment variables for web development
    CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium";
    GOOGLE_CHROME = "${pkgs.chromium}/bin/chromium";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
        #"starship"
      ];
    };
    shellAliases = {
      ll = "ls -l";
      update = "home-manager switch";
      rebuild = "sudo nixos-rebuild switch --flake /home/jadu/codespace/nix#itachi";
      clean = "sudo nix-collect-garbage -d";
      v = "nvim";
      x = "clear";
      q = "exit";
      y = "yazi";
      cd = "z";
      ls = "eza --icons";
      lt = "eza --icons --tree";
      code = "opencode";
      gi = "git add .";
      gc = "git commit -m";
      gs = "git status";
      ch = "chmod +x";
      rm = "rm -rf";
      mk = "mkdir";
      t = "touch";
      open = "xdg-open";
      fa = "fastfetch";
      th = "thunar";
      gp = "git push";
      ai = "ollama run phi3";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      autoload -U colors && colors
      setopt PROMPT_SUBST
      eval "$(zoxide init zsh)"
      # Define the hex color
      prompt_color="#b4befe"
      # Set the prompt to exactly [user@host:path]$ 
      PROMPT='%F{$prompt_color}[%n@%m:%~]$ %f'
      export NIXPKGS_ALLOW_UNFREE=1
      CHROME_EXECUTABLE="/etc/profiles/per-user/jadu/bin/chromium
      GOOGLE_CHROME="/etc/profiles/per-user/jadu/bin/chromium
    '';
    # zsh prompt =  export PS1="%{%F{243}%}%n%{%F{245}%}@%{%F{249}%}%m %{%F{254}%}%1~ %{%f%}$ "
  };
}
