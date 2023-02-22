<div align="center">
    <h1>My linux dot files 🌃</h1>
    <h3>I'm including a lot of things that most of you probably already know, but some new people, like my past self would like to find.</h3>
</div>
OS: Garuda wayfire, modified with new WM

WM: Hyprland

Terminal: gnome-terminal-transparency

Text editor: neovim (LazyVim)

Shell: fish

prompt: starship

wallpaper: https://www.deviantart.com/mb0sco/art/Lumei-Academy-Night-926901721

note taking app: obsidian

firefox new tab: Tablis

spotify colors: spicetify

task-manager: btop

### Install
this command is for arch linux. I used garuda wayfire edition as a starting point.

` yay -S hyprland-git swaybg dunst obsidian rofi btop hyprpicker upower gnome-terminal-transparency fish starship spicetify-cli neovim pokemon-colorscripts`

You need to change a few setting for your specific device, if you have bad resolution look into hyprland.conf and at the top line should be something like this: `monitor=eDP-1,1920x1080@120,0x0,1` change it to your monitor settings. Also in waybar in the file config, I've got hardcoded a few things, for example my bluetooth battery module, run: `~/.config/waybar/headet-battery -h` to find out more, it's a custom script.

### Neovim config
- Modification of LazyVim

### Waybar (you need to enable experimental features and than compile)

1. `git clone https://github.com/Alexays/Waybar`

 2.`cd Waybar`

3. Change this line 
`option('experimental', type : 'boolean', value : false, description: 'Enable experimental features')`

in the meson_options.txt file to this

 `option('experimental', type : 'boolean', value : true, description: 'Enable experimental features')`
 
4. `meson build`

5. `ninja -C build`

6. `./build/waybar`

 If you want to install it
 
7. `ninja -C build install`

8. `waybar`

### Gnome-terminal
I'm finding it a bit difficult to shift to kitty, so I'm using this for now. You have to run a few commands to configure the terminal
In case you want to backup
`dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt`
‼️This will wipe your current settings be causious‼️
1. `dconf reset -f /org/gnome/terminal/`
2. `dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt`

### Rofi custom themes:
- https://github.com/adi1090x/rofi

### Tabliss
- this is a firefox extension for a better new tab page
- settings included in the files

### Prettier liches
- This is a browser extension to change lichess colors
- color shcheme:
`{"primaryColor": "#4876D3","secondaryColor": "#F6B657","tertiaryColor": "#DD6161","backgroundColor": "#222731","surfaceColor": "#2D3442","surfaceColorHover": "#424B5B","defaultWhite": "#F2F5F3"}`

### Monkeytype
- Also included in files

Optional 

	- qemu - virtual machines 
	- nautilus - file explorer
	- ranger - another file explorer
	- obs studio - recording
	- vs codium - just in case
	- webcord - enables easy discord screen sharing on wlr
	- nwg-look - gtk themes
### Inspiration 
I took inspiration and some configs from https://github.com/iamverysimp1e/dots, if you like mine you will love his. 
