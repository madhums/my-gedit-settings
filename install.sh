#!/bin/bash

# Copy language definitions
mkdir -p ~/.local/share/gtksourceview-2.0/language-specs
cp lang-specs/* ~/.local/share/gtksourceview-2.0/language-specs/
#done


# Copy tools
mkdir -p ~/.gnome2/gedit/tools
cp tools/* ~/.gnome2/gedit/tools/
#done


# Register MIME-types
mkdir -p ~/.local/share/mime/packages
cp mime/*.xml ~/.local/share/mime/packages
update-mime-database ~/.local/share/mime
#done


# Copy Snippets
if [ ! -d $HOME/.gnome2/gedit/snippets ]; then
    mkdir -p ~/.gnome2/gedit/snippets
fi
cp snippets/* ~/.gnome2/gedit/snippets/
#done


# Copy plugins
if [ ! -d $HOME/.gnome2/gedit/plugins ]; then
    mkdir -p ~/.gnome2/gedit/plugins
fi
cp -R plugins/* ~/.gnome2/gedit/plugins/
#done


# Copy Styles
if [ ! -d $HOME/.gnome2/gedit/styles ]; then
    mkdir -p ~/.gnome2/gedit/styles
fi
cp styles/* ~/.gnome2/gedit/styles/
#done


gconftool-2 --set /apps/gedit-2/plugins/active-plugins -t list --list-type=str [align,completion,filebrowser,terminal,snippets,gedit_openfiles,reopen-tabs,smart_highlight,pair_char_completion,tabswitch]
gconftool-2 --set /apps/gedit-2/preferences/editor/auto_indent/auto_indent -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/bracket_matching/bracket_matching -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/current_line/highlight_current_line -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/cursor_position/restore_cursor_position -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/line_numbers/display_line_numbers -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/right_margin/display_right_margin -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/right_margin/right_margin_position -t int 80
gconftool-2 --set /apps/gedit-2/preferences/editor/colors/scheme -t str railscastsimp
gconftool-2 --set /apps/gedit-2/preferences/editor/tabs/insert_spaces -t bool true
gconftool-2 --set /apps/gedit-2/preferences/editor/tabs/tabs_size -t int 2
gconftool-2 --set /apps/gedit-2/preferences/editor/wrap_mode/wrap_mode -t str GTK_WRAP_NONE
gconftool-2 --set /apps/gedit-2/preferences/editor/save/create_backup_copy -t bool false
gconftool-2 --set /apps/gedit-2/preferences/editor/font/editor_font -t str 'Droid Sans Mono 11'
gconftool-2 --set /apps/gedit-2/preferences/editor/font/use_default_font -t bool false
echo "Configuration set."
