

THEME=$(/usr/bin/locate wheatgrass-theme.el | sort | grep emacs/2 | tail -1 | sed -e 's/wheatgrass-theme.el//')

cp /tmp/donkey-theme.el $THEME/
