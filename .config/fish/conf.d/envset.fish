#System Environment Path
set -x PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.bin:$HOME/.local/bin:$HOME/zig-0.8.0-dev/:/usr/local/lib/qt5/bin:$HOME/.local/lib/python3.9/site-packages:/usr/local/lib/python3.9/site-packages:$HOME/.local/lib/python3.8/site-packages:/usr/local/lib/python3.8/site-packages:$HOME/go/bin:$HOME/.cargo/bin

#BASIC ENV VAR
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8
set -x XKB_DEFAULT_LAYOUT "us"
set -x XKB_DEFAULT_RULES "evdev"
set -x XCURSOR_THEME Adwaita
set -x XCURSOR_SIZE 29

set -x TERM alacritty
set -x ALACRITTY_LOG /tmp/Alacritty-27190.log
set -x PAGER most
set -x COLORTERM truecolor
set -x EDITOR nano
set -x VISUAL fxite
set -x LOGFILE /tmp/wayland.log

#QT5-make envvar
set -x QTDIR /usr/local/lib/qt5
set -x QMAKE /usr/local/lib/qt5/bin/qmake
set -x LRELEASE /usr/local/lib/qt5/bin/lrelease
set -x MOC /usr/local/lib/qt5/bin/moc
set -x RCC /usr/local/lib/qt5/bin/rcc
set -x UIC /usr/local/lib/qt5/bin/uic
set -x QT_INCDIR /usr/local/include/qt5 
set -x QT_LIBDIR /usr/local/lib/qt5 
set -x QT_PLUGINDIR /usr/local/lib/qt5/plugins 
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x QT_QPA_PLATFORM "wayland"
set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -x QT_LOGGING_RULES "kwin_core.debug=true;kwin_libinput.debug=true"



if  set -q XDG_RUNTIME_DIR {
	if test -d $XDG_RUNTIME_DIR
		echo "XDG_RUNTIME_DIR Already set"
} else 
		set -x XDG_RUNTIME_DIR /tmp/1003/xdg-runtime-dir
		mkdir -p $XDG_RUNTIME_DIR && chmod 700 $XDG_RUNTIME_DIR
		echo $XDG_RUNTIME_DIR "Set and ready to use"
end


#Wayfire/wayland environment
set -x WAYFIRE_CONFIG_FILE /home/buckbucks/.config/wayfire.ini
#set -x GTK3_MODULES xapp-gtk3-module:xapp-gtk3-module
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x SDL_VIDEODRIVER wayland
set -x MOZ_ENABLE_WAYLAND 1
set -x MOZ_USE_XINPUT2 1
set -x GDK_BACKEND wayland

#Hikari
set -x HIKARI_CONFIG $HOME/.config/hikari/hikari.conf
#set -x DISPLAY :0 
#set -x WAYLAND_DISPLAY wayland-1
set -x CLUTTER_BACKEND wayland 

#KDE/PLASMA env
set -x KWIN_COMPOSE Q
#set -x LIBVA_DRIVER_NAME i965