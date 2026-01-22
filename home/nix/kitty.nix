{ config, pkgs, ... }:

# this is my kitty config in nix
# right now i dont use this if you want then
# just add this file in @jadu.nix as import-modlue

{
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 15.0;
      confirm_os_window_close = 0;
      cursor_shape = "block";
      cursor_blink_interval = 1.5;
      cursor_stop_blinking_after = 15.0;
      cursor_trail = 3;
      cursor_trail_delay = 0.1;
      window_padding_width = 4;
      window_margin_width = 6;
      draw_minimal_borders = "yes";
      tab_bar_min_tabs = 1;
      tab_bar_style = "hidden";
      tab_powerline_style = "round";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      scrollback_lines = 20000;
      scrollback_pager_history_size = 1000;
      scrollback_fill_enlarged_gap = "no";
      background_opacity = 0.85;
      dynamic_background_opacity = "yes";
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";
      resize_in_steps = "yes";
      mouse_hide_when_typing = "yes";
      focus_follows_mouse = "yes";
      pointer_shape_when_grabbed = "arrow";
      url_prefixes = "http https file ftp ftps git ssh";
      detect_urls = "yes";
      url_style = "curly";
      remember_window_size = "yes";
      initial_window_width = "120c";
      initial_window_height = "60c";
      enable_ligatures = "cursor";
      shell_integration = "disabled";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      enabled_layouts = "tall,fat,grid,stack,splits,horizontal,vertical";
      default_layout = "tall";
      linux_display_server = "auto";
      font_family = "Monaspace Radon NF";
    };
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "ctrl+shift+z" = "toggle_audio_bell";
      "super+shift+enter" = "new_tab";
      "super+shift+o" = "launch --location=vsplit --cwd=current";
      "super+shift+q" = "close_tab";
      "super+shift+i" = "launch --type=tab --cwd=current btop";
      "super+shift+v" = "launch --type=tab --cwd=current nvim .";
      "super+shift+y" = "launch --type=tab --cwd=current yazi";
    };
  };

  xdg.configFile."kitty/themes/noctalia.conf".text = ''
    color0 #131319
    color1 #ffb4ab
    color2 #c7bfff
    color3 #c7c1f3
    color4 #ffb787
    color5 #c7bfff
    color6 #c7c1f3
    color7 #e5e1eb
    color8 #928f9e
    color9 #ffb4ab
    color10 #c7bfff
    color11 #c7c1f3
    color12 #ffb787
    color13 #c7bfff
    color14 #c7c1f3
    color15 #e5e1eb

    cursor                #e5e1eb
    cursor_text_color     #131319
    background            #131319
    foreground            #e5e1eb
    selection_foreground  #c8c4d5
    selection_background  #474552
    url_color             #c7bfff
  '';
}
