noblacklist ${HOME}/.surf
noblacklist /opt/surf-0.6/
noblacklist ${HOME}/.surf/bookmarks

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

blacklist /data
whitelist ${HOME}/.surf/
include /etc/firejail/whitelist-common.inc

