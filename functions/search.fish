function search 
    if test -e /usr/sbin/pkg_info
	    pkg_info -Q $argv
    else if test -e /usr/bin/xbps-query
        xbps-query -Rs $argv
    else if test -e /usr/bin/eix 
    	eix $argv
    else
        echo Error
    end
end
