{ config, nixpkgs, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    # ## FIRST LINE/ROW: Info & Status
    # # First param ─┌
    # [username]
    # format = " [╭─$user]($style) "
    # show_always = true
    # style_root = "bold 223"
    # style_user = "223"
    # 
    # # Second param
    # 
    # [directory]
    # style = "214"
    # truncate_to_repo = true
    # truncation_length = 3
    # truncation_symbol = "🗄️: "
    # 
    # # Third param
    # [sudo]
    # symbol = "👮 "
    # disabled = false
    # 
    # # Before all the version info (python, nodejs, php, etc.)
    # [git_status]
    # disabled = true
    # ahead = "⇡${count}"
    # behind = "⇣${count}"
    # deleted = "x"
    # diverged = "⇕⇡${ahead_count}⇣${behind_count}"
    # style = "223"
    # 
    # # Last param in the first line/row
    # [cmd_duration]
    # disabled = false
    # format = "⏳ [$duration]($style)"
    # min_time = 1
    # style = "bold yellow"
    # 
    # 
    # # Prompt: param 2
    # [character]
    # error_symbol = " [×](223)"
    # success_symbol = " [╰─λ](223)"
    # 
    # # SYMBOLS
    # [status]
    # disabled = false
    # format = '[\[$symbol$status_common_meaning$status_signal_name$status_maybe_int\]]($style)'
    # map_symbol = true
    # style = "215"
    # pipestatus = true
    # symbol = ""
    # 
    # [aws]
    # symbol = " "
    # 
    # [conda]
    # symbol = " "
    # 
    # [dart]
    # symbol = " "
    # 
    # [docker_context]
    # symbol = " "
    # 
    # [elixir]
    # symbol = " "
    # 
    # [elm]
    # symbol = " "
    # 
    # [git_branch]
    # format = ""
    # ignore_branches = ['master', 'main']
    # symbol = " "
    # 
    # [golang]
    # symbol = " "
    # 
    # [hg_branch]
    # symbol = " "
    # 
    # [java]
    # symbol = " "
    # 
    # [julia]
    # symbol = " "
    # 
    # [nim]
    # symbol = " "
    # 
    # [nix_shell]
    # symbol = " "
    # 
    # [nodejs]
    # symbol = " "
    # 
    # [package]
    # symbol = "📦 "
    # 
    # [perl]
    # symbol = " "
    # 
    # [php]
    # symbol = " "
    # 
    # [python]
    # symbol = " "
    # 
    # [ruby]
    # symbol = " "
    # 
    # [rust]
    # symbol = " "
    # 
    # [swift]
    # symbol = "ﯣ "

    settings = {
      ## SECOND LINE/ROW: Git
      username = {
        format = " [╭─$user]($style) ";
        show_always = true;
        style_root = "bold 223";
        style_user = "223";

      };

      directory = {
        style = "214";
        truncate_to_repo = true;
        truncation_length = 3;
        truncation_symbol = "🗄️: ";

      };

      sudo = {
        symbol = "👮 ";
        disabled = false;

      };


      cmd_duration = {
        disabled = false;
        format = "⏳ [$duration]($style)";
        min_time = 1;
        style = "bold yellow";

      };

      ## THIRD LINE/ROW: Prompt

      character = {
        error_symbol = " [×](223)";
        success_symbol = " [╰─λ](223)";

      };

      ## SYMBOLS

      status = {
        disabled = false;
        format = "[ \[ $symbol$status_common_meaning$status_signal_name$status_maybe_int\ ] ] ($style)";
        map_symbol = true;
        style = "215";
        pipestatus = true;
        symbol = "";

      };

      aws = {
        symbol = " ";

      };

      conda = {
        symbol = " ";

      };

      dart = {
        symbol = " ";

      };

      docker_context = {
        symbol = " ";

      };

      elixir = {
        symbol = " ";

      };

      elm = {
        symbol = " ";

      };

      git_branch = {
        format = "";
        ignore_branches = [ "master" "main" ];
        symbol = " ";

      };

      golang = {
        symbol = " ";

      };

      hg_branch = {
        symbol = " ";

      };

      java = {
        symbol = " ";

      };

      julia = {
        symbol = " ";

      };

      nim = {
        symbol = " ";

      };

      nix_shell = {
        symbol = " ";

      };

      nodejs = {
        symbol = " ";

      };

      package = {
        symbol = "📦 ";

      };

      perl = {
        symbol = " ";

      };

      php = {
        symbol = " ";

      };

      python = {
        symbol = " ";

      };

      ruby = {
        symbol = " ";

      };

      rust = {
        symbol = " ";

      };

      swift = {
        symbol = "ﯣ ";

      };


    };

  };

}