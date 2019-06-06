# dotfiles

These are all my dotfiles. The following serves as a reminder for me just in case I forget how any of these work.

## setup

### scripts and live-wallpapers

Make symbolic links at `~/scripts` for scripts and `~/Pictures/live-wallpapers` for live-wallpapers.

### fonts

you'll need

- undefined-medium
- Ubuntu Nerd Font
- Unifont
- ttf-baekmuk
- ttf-hannom
- ttf-hanazono

### everything else

Do this command: `stow ${PKGNAME}` for each path.  
If stow isn't installed, then do `sudo pacman -S stow`.  

### terminal

I use [Luke Smith's build of the suckless terminal](https://github.com/LukeSmithxyz/st).  

### little details

Polybar needs Ubuntu Nerd Fonts and unifont-medium.  
i3 needs:

- mpv and xwinwrap for the live wallpaper script
- compton for transparency
- flashfocus for focus indication
- scrot for screenshots
- betterlockscreen for locking functionality


