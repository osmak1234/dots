{ config, nixpkgs, ... }: {



  programs.fish = {
    enable = true;

    shellAliases = {
      youtube-dl = "yt-dlp";
      nevim = "nvim";
      gt = "gt.sh";
      pipes = "pipes.sh";
      cls = "clear && ls";
      changebuild = "npx nodemon --watch src -e rs --exec cargo run";
      conve = "cd /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/";
      cw = "cargowatch.sh";
      cr = "cargo run";
      cb = "cargo build";
      ls = "eza -al --color=always --group-directories-first --icons"; # preferred listing;
      la = "eza -a --color=always --group-directories-first --icons"; # all files and dirs
      ll = "eza -l --color=always --group-directories-first --icons"; # long format
      lt = "eza -aT --color=always --group-directories-first --icons"; # tree listing
      "l." = "eza -a | egrep '^\.'"; # show only dotfiles;
      ip = "ip -color";
      Token = "cat ~/git-token.txt";

      grubup = "sudo update-grub";
      tarnow = "tar -acf ";
      untar = "tar -xvf ";
      wget = "wget -c ";
      psmem = "ps auxf | sort -nr -k 4";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10";
      upd = "/usr/bin/garuda-update";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      dir = "dir - -color=auto";
      vdir = "vdir --color=auto";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      hw = "hwinfo - -short"; # Hardware Info
      crun = "clear && clang++ main.cpp && ./a.out";
      jctl = "journalctl -p 3 -xb";
    };

    shellInit = ''
      ## Set values
      # Hide welcome message
      set fish_greeting
      set VIRTUAL_ENV_DISABLE_PROMPT 1
      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

      ## Export variable need for qt-theme
      if type qtile >>/dev/null 2>&1
          set -x QT_QPA_PLATFORMTHEME qt5ct
      end

      # Set settings for https://github.com/franciscolourenco/done
      set -U __done_min_cmd_duration 10000
      set -U __done_notification_urgency_level low


      ## Environment setup
      # Apply .profile: use this to put fish compatible .profile stuff in
      if test -f ~/.fish_profile
          source ~/.fish_profile
      end

      # Add ~/.local/bin to PATH
      if test -d ~/.local/bin
          if not contains -- ~/.local/bin $PATH
              set -p PATH ~/.local/bin
          end
      end

      # Add depot_tools to PATH
      if test -d ~/Applications/depot_tools
          if not contains -- ~/Applications/depot_tools $PATH
              set -p PATH ~/Applications/depot_tools
          end
      end



      ## Functions
      # Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
      function __history_previous_command
          switch (commandline -t)
              case "!"
                  commandline -t $history[1]
                  commandline -f repaint
              case "*"
                  commandline -i !
          end
      end

      function __history_previous_command_arguments
          switch (commandline -t)
              case "!"
                  commandline -t ""
                  commandline -f history-token-search-backward
              case "*"
                  commandline -i '$'
          end
      end

      if [ "$fish_key_bindings" = fish_vi_key_bindings ]
          bind -Minsert ! __history_previous_command
          bind -Minsert '$' __history_previous_command_arguments
      else
          bind ! __history_previous_command
          bind '$' __history_previous_command_arguments
      end

      # Fish command history
      function history
          builtin history --show-time='%F %T '
      end

      function backup --argument filename
          cp $filename $filename.bak
      end

      # Copy DIR1 DIR2
      function copy
          set count (count $argv | tr -d \n)
          if test "$count" = 2; and test -d "$argv[1]"
              set from (echo $argv[1] | trim-right /)
              set to (echo $argv[2])
              command cp -r $from $to
          else
              command cp $argv
          end
      end

      ## Useful aliases

      ## Run fastfetch if session is interactive
      if status --is-interactive && type -q fastfetch
          pokemon-colorscripts -r --no-title
      end

      # pnpm
      set -gx PNPM_HOME "/home/user/.local/share/pnpm"
      if not string match -q -- $PNPM_HOME $PATH
          set -gx PATH "$PNPM_HOME" $PATH
      end
      # pnpm end

      starship init fish | source
    '';
  };
}

