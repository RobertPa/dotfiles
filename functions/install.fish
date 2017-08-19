function install
    if test -e /usr/sbin/pkg_add
	doas pkg_add $argv
    else if test -e /usr/bin/emerge
	    sudo emerge --ask --verbose $argv
    else if test -e /usr/bin/xbps-install
        sudo xbps-install -S $argv
    else 
        echo No package manager found
    end
end
