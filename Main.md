I'm including a lot of things that most of you probably already know, but some new people, like my past self would like to find. 

OS: Garuda wayfire, modified with new WM
WM: Hyprland
Terminal: gnome-terminal-transparency
Text editor: neovim (LazyVim)
Shell: fish
prompt: starship
wallpaper: https://www.deviantart.com/mb0sco/art/Lumei-Academy-Night-926901721
note taking: obsidian
firefox new tab: Tablis
spotify colors: spicetify
task-manager: btop

` yay -S hyprland-git dunst rofi btop hyprpicker obsidian gnome-terminal-transparency fish starship spicetify-cli neovim pokemon-colorscripts`

### Neovim config
- Modification of LazyVim

### Waybar (you need to enable experimental features and than compile)
1. `git clone https://github.com/Alexays/Waybar`
`cd Waybar`
2. Change this line 
`option('experimental', type : 'boolean', value : false, description: 'Enable experimental features')`
in the meson_options.txt file to this
 `option('experimental', type : 'boolean', value : false, description: 'Enable experimental features')`
3. `meson build`
4. `ninja -C build`
5. `./build/waybar`
 If you want to install it
6. `ninja -C build install`
7. `waybar`

### Rofi custom themes:
- https://github.com/adi1090x/rofi

### Tabliss
- this is a firefox extension for a better new tab page
- settings included in the files

### Prettier liches
- color shcheme:
`{"primaryColor": "#4876D3","secondaryColor": "#F6B657","tertiaryColor": "#DD6161","backgroundColor": "#222731","surfaceColor": "#2D3442","surfaceColorHover": "#424B5B","defaultWhite": "#F2F5F3"}`

### Monkeytype
- Also included in files

Optional 
	qemu - virtual machines
	firefox - browser
	nautilus - file explorer
	ranger - another file explorer
	obs studio - recording
	vs codium - just in case
	webcord - enables easy discord screen sharing on wlr
	nwg-look - gtk themes
	