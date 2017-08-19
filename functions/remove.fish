function remove
    if test -e /usr/sbin/pkg_delete
        doas pkg_delete $argv
    else if test -e /usr/bin/xbps-remove
        sudo xbps-remove -R $argv
    else
	    doas emerge -cav $argv
    end
end
