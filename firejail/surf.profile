noblacklist ${HOME}/.surf
noblacklist ${HOME}/.surf/bookmarks
whitelist ${HOME}/.surf/bookmarks

include /etc/firejail/disable-common.inc
include /etc/firejail/disable-programs.inc
include /etc/firejail/disable-devel.inc

caps.drop all
netfilter
nonewprivs
noroot
protocol unix,inet,inet6,netlink
seccomp
tracelog
whitelist ${HOME}/.surf/
include /etc/firejail/whitelist-common.inc

