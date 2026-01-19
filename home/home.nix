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
      pip = "pipes-rs";
      ai = "ollama run phi3";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
            autoload -U colors && colors
            setopt PROMPT_SUBST
            eval "$(zoxide init zsh)"
            # Define the hex color
            #prompt_color="#b4befe"
            # Set the prompt to exactly [user@host:path]$ 
            #PROMPT='%F{$prompt_color}[%n@%m:%~]$ %f'
            export NIXPKGS_ALLOW_UNFREE=1
            CHROME_EXECUTABLE="/etc/profiles/per-user/jadu/bin/chromium
            GOOGLE_CHROME="/etc/profiles/per-user/jadu/bin/chromium
              # --- Catppuccin Mocha Lavender Theme Colors ---
        export CL_LAVENDER="#b4befe"
        export CL_SUBTEXT0="#a6adc8"
        export CL_SURFACE2="#585b70"
        export CL_RED="#f38ba8"
        export CL_MAUVE="#cba6f7"

      # Load Version Control System (VCS) info
        autoload -Uz vcs_info
        precmd() { vcs_info }

      # Format Git Status
        zstyle ':vcs_info:git:*' formats " %F{$CL_SUBTEXT0}on%f %F{$CL_LAVENDER}󰊢 %b%f%u%c"
        zstyle ':vcs_info:git:*' actionformats " %F{$CL_SUBTEXT0}on%f %F{$CL_LAVENDER}󰊢 %b%f %F{$CL_RED}(%a)%f"
        zstyle ':vcs_info:*' check-for-changes true
        zstyle ':vcs_info:*' unstagedstr " %F{$CL_RED}●%f"
        zstyle ':vcs_info:*' stagedstr " %F{$CL_LAVENDER}✚%f"

      # Define the Prompt
      # %~: Current Directory | %v: VCS Info | %#: # for root, % for user
        PROMPT='
        %F{$CL_LAVENDER}%~%f$vcs_info_msg_0_
        %(?.%F{$CL_LAVENDER}.%F{$CL_RED})%(#.#.❯)%f '

      # Right Prompt (Optional: Read-only and Root indicator)
        RPROMPT='%(#.%F{$CL_RED}󰀦 ROOT.%F{$CL_SUBTEXT0}%(!..%*))%f%1(v..%F{$CL_RED}%v%f)%f%L%(!..%F{$CL_RED}%{%f%})%f%20<..<%21(l..%F{$CL_SURFACE2}%L%f)'

      # Logic for Read-Only indicator (Right side)
        function check_readonly() {
          if [[ ! -w . ]]; then
            echo "%F{$CL_RED}󰌾 RO%f"
          fi
        }
        RPROMPT='$(check_readonly)'
    '';
    # zsh prompt =  export PS1="%{%F{243}%}%n%{%F{245}%}@%{%F{249}%}%m %{%F{254}%}%1~ %{%f%}$ "
  };
}
