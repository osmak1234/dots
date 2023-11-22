{ config, nixpkgs, ... }: {

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    enableNvidiaPatches = true;
    extraConfig = ''

# startup commands
exec-once=swaybg -o \* -i ~/gruvbox_astro.jpg -m fill
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=fcitx5 -D
exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=waybar
exec-once=systemctl start libvirtd-tls.socket
exec-once=librewolf
exec-once=dunst
exec-once=wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"
exec-once=syncthing
exec-once=nm-applet
exec-once=spotifyd --no-daemon


##########
#monitors#
##########

monitor=eDP-1,1920x1080@120,0x0,1
monitor=eDP-2,1920x1080@120,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1

#################
#Hyprland config#
#################



input {
  kb_layout=us,cz
  kb_variant=,qwerty
  kb_options=caps:escape, grp:alt_space_toggle
  repeat_rate=50
  repeat_delay=240

  touchpad {
    disable_while_typing=1
    natural_scroll=1
    clickfinger_behavior=1
    middle_button_emulation=1
    tap-to-click=1
  }
}

gestures {
  workspace_swipe=true
  workspace_swipe_min_speed_to_force=5
}

general {
    layout=master
    sensitivity=1.0
    gaps_in=4
    gaps_out=8
    border_size=2
    col.active_border=0xABA89984
    col.inactive_border=0x66333333
    apply_sens_to_raw=0
    cursor_inactive_timeout=3 }

decoration {
    rounding=6
    blur {
    size=9.8
    passes=2
    new_optimizations = true
      }
}

animations {
    enabled=1
    animation=windows,1,7,default
    animation=fade,1,10,default
    animation=workspaces,0,9,default
}

dwindle {
    pseudotile
    force_split=2
}

master {
  new_on_top=true
  no_gaps_when_only = false
}

misc {
  disable_hyprland_logo=true
  disable_splash_rendering=true
  mouse_move_enables_dpms=true
}

env = EDITOR, nvim
env = VISUAL, nvim
env = WLR_NO_HARDWARE_CURSORS,1

# windowrules

windowrule=workspace 2, librewolf
windowrule=workspace 6, virt-manager
windowrule=workspace 7, nautilus
windowrule=workspace 8, webcord
windowrule=float,Rofi
windowrule=float,pavucontrol
windowrulev2 = float,class:^()$,title:^(Picture in picture)$
windowrulev2 = float,class:^(brave)$,title:^(Save File)$
windowrulev2 = float,class:^(brave)$,title:^(Open File)$
windowrulev2 = float,class:^(firefox)$,title:^(Picture-in-Picture)$

windowrule=float,floating

windowrule=opacity 0.92,Thunar
windowrule=workspace 3, Code

^.*nvim.*$
windowrule=tile,firefox
windowrule=workspace 7, 1password
windowrule=tile,spotify
windowrule=opacity 1,neovim
windowrule=opacity 0.8,Rofi
windowrule=animation popin,Rofi
windowrule=workspace 2, firefox
windowrule=workspace 4, spotify
windowrule=workspace 8, discord

// special rules for spotify
windowrulev2 = tile, class:^(Spotify)$
windowrulev2 = workspace 9, class:^(Spotify)$


workspace=HDMI-A-1,1
workspace=HDMI-A-1,2
workspace=HDMI-A-1,3
workspace=HDMI-A-1,4
workspace=HDMI-A-1,5
workspace=HDMI-A-1,6
workspace=HDMI-A-1,7
workspace=HDMI-A-1,8



# start apps
bind=SUPER, i, exec, spotify
bind=SUPER, r, exec, obsidian
bind=SUPERSHIFT,S,exec, nautilus -w
bind=SUPER,B,exec, librewolf 
bind=SUPERSHIFT,B,exec, firefox
bind=SUPER,T, exec, kitty -o allow_remote_control=yes -o enabled_layouts=tall
bind=SUPERSHIFT,T, exec, kitty -o allow_remote_control=yes  --directory ~/.config  nvim

bind=SUPER, A, exec, ~/.config/waybar.sh

bind=SUPER, Y, exec, librewolf --new-tab https://www.youtube.com/
 
bind=SUPER, U, exec, ~/coding/charge.sh 1
bind=SUPERSHIFT,U, exec, ~/coding/charge.sh 0

bind=SUPER,M, exec, kitty --class "floating" -o allow_remote_control=yes  -o remember_window_size=nom  -o initial_window_width=500 -o initial_window_height=350 pomo

# copy
bind=SUPER,P, exec, cat ~/1.txt | wl-copy

# start work
bind=SUPERSHIFT,W,exec, /home/user/coding/work.sh

# start windows
bind=SUPERSHIFT,A, exec, ~/coding/virtualmachine.sh

# copy github auth toke to clipboard
bind=SUPER, G, exec, cat ~/gittoken.txt | wl-copy

# clipboard history
bind=SUPER, I, exec, clipman --histpath="~/.local/share/clipman-primary.json" pick --tool rofi 

# color picker
bind=SUPER,c,exec, hyprpicker -a

# drun
bind=SUPER,d,exec, rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-3.rasi

# sleep
bind=SUPERSHIFT, Y, exec, ~/coding/sleep.sh

# emoji picker
bind=SUPER,e,exec, rofi -show emoji -theme ~/.config/rofi/launchers/type-1/style-3.rasi

# Screen shot
bind=SUPERSHIFT,P,exec,bash ~/.config/hypr/scripts/screenshots.sh

# swaylock
bind = SUPER, escape, exec, swaylock --image ~/gruvbox_astro.jpg

# XF stuff
bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle
bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -2%
bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +2%
bind=,XF86AudioPlay,exec,playerctl play-pause
bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle
bind=,XF86MonBrightnessUp,exec,brightnessctl -q set 5%+
bind=,XF86MonBrightnessDown,exec,brightnessctl -q set 5%-
bind=,XF86AudioNext,exec,playerctl next
bind=,XF86AudioPrev,exec,playerctl previous
bind=,XF86AudioStop,exec,playerctl stop
bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle

# start wshowkeys if it is not running, otherwise kill it
bind=SUPER,slash,exec, ~/.config/hypr/scripts/screenkeys.sh

# bluetooth, add your specific device in here ↙️  it's the MAC addres
bind=SUPER,o,exec, bluetoothctl connect 0C:8D:CA:0A:DF:15
bind=SUPERSHIFT, O, exec, bluetoothctl disconnect

# mouse resize
bindm=SUPER,mouse:272,movewindow
bindm=SUPER,mouse:273,resizewindow

# basic hyprland binds
bind=SUPER,Q,killactive
bind=SUPERSHIFT,F,fullscreen,0
bind=SUPERSHIFT,Q,exit,
bind=SUPER, F, togglefloating,
bind=SUPERSHIFT,RETURN,layoutmsg,swapwithmaster
bind=SUPER,j,layoutmsg,cyclenext
bind=SUPER,k,layoutmsg,cycleprev

# lf file manager  in kitty in tile 
bind=SUPER,s,exec, kitty lf

# move focus
bind=SUPER,h,movefocus,l
bind=SUPER,l,movefocus,r
bind=SUPER,k,cyclenext
bind=SUPER,left,resizeactive,-40 0
bind=SUPER,right,resizeactive,40 0

# move windows
bind=SUPERSHIFT,h,movewindow,l
bind=SUPERSHIFT,l,movewindow,r
bind=SUPERSHIFT,k,movewindow,u
bind=SUPERSHIFT,j,movewindow,d

# workspaces
bind=SUPER,1,focusmonitor,DP-2
bind=SUPER,1,workspace,1
bind=SUPER,2,focusmonitor,DP-2
bind=SUPER,2,workspace,2
bind=SUPER,3,focusmonitor,DP-2
bind=SUPER,3,workspace,3
bind=SUPER,4,focusmonitor,DP-2
bind=SUPER,4,workspace,4
bind=SUPER,5,focusmonitor,DP-2
bind=SUPER,5,workspace,5
bind=SUPER,6,focusmonitor,DP-2
bind=SUPER,6,workspace,6
bind=SUPER,7,focusmonitor,DP-2
bind=SUPER,7,workspace,7
bind=SUPER,8,focusmonitor,DP-3
bind=SUPER,8,workspace,8
bind=SUPER,9,focusmonitor,DP-3
bind=SUPER,9,workspace,9
bind=SUPER,0,focusmonitor,DP-3
bind=SUPER,0,workspace,0

bind=SUPERSHIFT,1,movetoworkspacesilent,1
bind=SUPERSHIFT,2,movetoworkspacesilent,2
bind=SUPERSHIFT,3,movetoworkspacesilent,3
bind=SUPERSHIFT,4,movetoworkspacesilent,4
bind=SUPERSHIFT,5,movetoworkspacesilent,5
bind=SUPERSHIFT,6,movetoworkspacesilent,6
bind=SUPERSHIFT,7,movetoworkspacesilent,7
bind=SUPERSHIFT,8,movetoworkspacesilent,8
bind=SUPERSHIFT,9,movetoworkspacesilent,9

      '';
  };
}

