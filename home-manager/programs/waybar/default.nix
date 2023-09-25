{ config, nixpkgs, ... }: {
  programs.waybar = {
    systemd = {
      enable = true;
      target = "graphical.target";
    };


    enable = true;
    style = ''
    
* {
  min-height: 0;
  font-family: FiraMono Nerd Font;
  font-size: 14px;
  font-weight: 600;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#backlight,
#pulseaudio,
#custom-media,
#tray,
#mode,
#network,
#custom-power-menu,
#workspaces,
#workspaces button,
#idle_inhibitor,
#custom-power-menu,
#custom-headset-battery,
#custom-spotify {
  margin: 5px;
  padding: 5px 5px;
  color: #ebdbb2;
  border-radius: 4.5px;
  background-color: rgba(26, 27, 38, 0.2);
}
window#waybar {
  background-color: rgba(26, 27, 38, 0);
  color: #ffffff;
  transition-property: background-color;
  transition-duration: 0.5s;
  border-radius: 8px;
  transition-duration: 0.5s;
}

window#waybar.hidden {
  opacity: 0.2;
}

#workspaces button {
  padding: 0 5px;
  background-color: transparent;
  box-shadow: inset 0 -3px transparent;
  border: none;
  border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
  background: rgba(0, 0, 0, 0.2);
}

#workspaces button.focused {
  color: #6a92d7;
}

#workspaces button.active {
  color: #813f0b;
}

#workspaces button.urgent {
  background-color: #2986cc;
}

#network {
  margin: 5px;
  padding-left: 10px;
  padding-right: 19px;
  border-radius: 9.5px;
}

#workspaces {
  padding: 4px 8px;
  margin: 5px;
  border-radius: 9.5px;
}

#battery.charging,
#battery.full,
#battery.plugged {
  color: #9fe2bf;
  margin: 5px;
}
@keyframes blink {
  to {
    background-color: rgba(30, 34, 42, 0.5);
    color: #abb2bf;
  }
}

#battery.critical:not(.charging) {
  color: #f53c3c;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#tray > .passive {
  -gtk-icon-effect: dim;
  color: #ebdbb2;
}

#tray > .needs-attention {
  -gtk-icon-effect: highlight;
}

#custom-spotify {
  margin: 5px;
}

'';
    # {
    #     "height": 40, 
    #     "spacing": 4, 
    #     "modules-left": ["wlr/workspaces","tray", "cpu", "memory", "disk", "custom/battery" ],
    #     "modules-center": ["custom/spotify"],
    #     "modules-right": ["custom/vpn", "backlight",  "pulseaudio","custom/headset-battery", "battery","date", "clock", "custom/power-menu"],
    #     "wlr/workspaces": {
    # 	"format": "{icon}",
    #   "on-click": "activate",
    # 	"format-icons": {
    # 		"1": "",
    # 		"2": "",
    # 		"3": "",
    # 		"4": "",
    #     "6": "",
    #     "7": "",
    # 		"8": "",
    # 		"focused": "",
    # 		"default": "",
    # 	},
    # 	"sort-by-number": true
    # },
    # "custom/vpn": {
    #     "format": "VPN ",
    #     "exec": "echo '{\"class\": \"connected\"}'",
    #     "exec-if": "test -d /proc/sys/net/ipv4/conf/tun0",
    #     "return-type": "json",
    #     "interval": 5
    # },
    # "custom/battery": {
    #   "format":"{}",
    #   "exec": "~/coding/charge.sh",
    #   "interval": 10,
    #   "on-scroll-up": "~/coding/charge.sh 1",
    #   "on-scroll-down": "~/coding/charge.sh 0",
    #   },
    # 
    # "disk": {
    #     "interval": 30,
    #     "format": "󰋊 {percentage_free}%",
    #     "path": "/",
    #     "on-click": "nautilus -w"
    # 
    # },
    #     "hyprland/window": {
    #         "format": "{:.15}"
    # 
    # 
    #     },
    #     "tray": {
    #          "icon-size": 21,
    #         "spacing": 10
    #     },
    #     "clock": {
    #         "format": "<span color='#bf616a'></span> {:%I:%M %p}",
    #     },
    #     "date": {
    #         "format": "<span color='#bf616a'></span> {:%a %b %d}",
    #         "format-alt": "<span color='#bf616a'></span> {:%d/%m}",
    # 
    # 
    #       },
    # 
    #     "cpu": {
    #       "interval": 10,
    #       "format": " {}%",
    #       "max-length": 10,
    #       "on-click": "",
    #     },
    #     "memory": {
    #         "interval": 30,
    #         "format": " {}%",
    #         "format-alt":" {used:0.1f}G",
    #         "max-length": 10,
    #     },
    #     "backlight": {
    #         "device": "DP-1",
    #         "format": "{icon} {percent}%",
    #         "format-icons": ["", "", "", "", "", "", "", "", ""],
    #         "on-click": "",
    #         "on-scroll-up": "brightnessctl --exponent=2 set 5%+",
    #         "on-scroll-down": "brightnessctl --exponent=2 set 5%-",
    # 
    #     },
    #     "network": {
    #         "format-ethernet": "󰈀",
    #         "format-wifi": "",
    #         "format-disconnected": "󰖪",
    #         "on-click": "gnome-terminal -- wifi-menu",
    #     },
    # 
    #     "pulseaudio": {
    #         "format": "{icon} {volume}%",
    #         "format-bluetooth": "{icon} {volume}%",
    #         "format-bluetooth-muted": "婢 {icon} {format_source}",
    #         "format-muted": "婢",
    #         "format-icons": {
    #             "headphone": "",
    #             "hands-free": "",
    #             "headset": "",
    #             "phone": "",
    #             "portable": "",
    #             "car": "",
    #             "default": ["", "", ""]
    #         },
    #         "on-click": "pavucontrol"
    #     },
    #     "custom/launcher": {
    #         "format": " <span color='#6a92d7'>  </span> ",
    #         "on-click": "rofi -show drun",
    #     },
    #     "custom/power-menu": {
    #         "format": "<span color='#6a92d7'></span> ",
    #         "on-click": " bash ~/.config/rofi/powermenu/type-1/powermenu.sh",
    #     },
    #     "custom/headset-battery": {
    #         "format": "󰥉 {}%",
    #         "interval": 3,
    #         "exec": "~/.config/waybar/headset-battery 0C_8D_CA_0A_DF_15 no-output-on-fail",
    #       },
    # 
    #    "custom/spotify": {
    #      "interval": 1,
    #     "exec": "playerctl metadata title",
    #     "format": "{:.40}",
    #     "on-click": "playerctl play-pause",
    #     "on-scroll-up": "playerctl next",
    #     "on-scroll-down": "playerctl previous",
    #     },
    # 
    #     "battery": {
    #       "bat": "BAT0",
    #       "adapter": "ADP0",
    #       "interval": 60,
    #       "states": {
    #           "warning": 30,
    #           "critical": 15
    #       },
    # 
    #       "max-length": 20,
    #       "format": "{icon} {capacity}%",
    #       "format-warning": "{icon} {capacity}%",
    #       "format-critical": "{icon} {capacity}%",
    #       "format-charging": "  {capacity}%",
    #       "format-plugged": "  {capacity}%",
    #       "format-alt": "{icon} {time}",
    #       "format-full": "  {capacity}%",
    #       "format-icons": [" ", " ", " ", " ", " "],
    #     },
    # }

    settings = [{
      height = 40;
      spacing = 4;
      position = "top";
      modules_left = [
        "wlr/workspaces"
        "tray"
        "cpu"
        "memory"
        "disk"
        "custom/battery"
      ];
      modules_center = [
        "custom/spotify"
      ];
      modules_right = [
        "custom/vpn"
        "backlight"
        "pulseaudio"
        "custom/headset-battery"
        "battery"
        "date"
        "clock"
        "custom/power-menu"
      ];

      "wlr/workspaces" = {
        format = "{icon}";
        on_click = "activate";
        format_icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "8" = "";
          default = "";
        };
        sort_by_number = true;
      };

      "custom/vpn" = {
        format = "VPN ";
        exec = "echo '{\"class\": \"connected\"}'";
        exec_if = "test -d /proc/sys/net/ipv4/conf/tun0";
        return_type = "json";
        interval = 5;
      };

      "custom/battery" = {
        format = "{}";
        exec = "~/coding/charge.sh";
        interval = 10;
        on_scroll_up = "~/coding/charge.sh 1";
        on_scroll_down = "~/coding/charge.sh 0";
      };

      disk = {
        interval = 30;
        format = "󰋊 {percentage_free}%";
        path = "/";
        on_click = "nautilus -w";
      };

      "hyprland/window" = {
        format = "{:.15}";
      };

      tray = {
        icon_size = 21;
        spacing = 10;
      };

      clock = {
        format = "<span color='#bf616a'></span> {:%I:%M %p}";
      };

      date = {
        format = "<span color='#bf616a'></span> {:%a %b %d}";
        format_alt = "<span color='#bf616a'></span> {:%d/%m}";
      };

      cpu = {
        interval = 10;
        format = " {}%";
        max_length = 10;
        on_click = "";
      };

      memory = {
        interval = 30;
        format = " {}%";
        format_alt = " {used:0.1f}G";
        max_length = 10;
      };

      backlight =
        {
          device = "DP-1";
          format = "{icon} {percent}%";
          format_icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          on_click = "";
          on_scroll_up = "brightnessctl --exponent=2 set 5%+";
          on_scroll_down = "brightnessctl --exponent=2 set 5%-";
        };

      battery = {
        bat = "BAT0";
        adapter = "ADP0";
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        max_length = 20;
        format = "{icon} {capacity}%";
        format_warning = "{icon} {capacity}%";
        format_critical = "{icon} {capacity}%";
        format_charging = "  {capacity}%";
        format_plugged = "  {capacity}%";
        format_alt = "{icon} {time}";
        format_full = "  {capacity}%";
        format_icons = [
          " "
          " "
          " "
          " "
          " "
        ];
      };

      "custom/spotify" = {
        interval = 1;
        exec = "playerctl metadata title";
        format = "{:.40}";
        on_click = "playerctl play-pause";
        on_scroll_up = "playerctl next";
        on_scroll_down = "playerctl previous";
      };

    }];
  };
}




