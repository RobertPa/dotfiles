function update4
    if test -e /usr/bin/xbps-install
        sudo xbps-install -Su
    else
	    doas emerge --verbose --ask --update --deep --with-bdeps=y --newuse @world
    end
end
