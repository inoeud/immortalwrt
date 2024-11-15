#!/bin/sh

uci set dhcp.lan.leasetime='30m'
uci set dhcp.lan.ra='server'
uci set dhcp.lan.ra_slaac='1'
uci del dhcp.lan.ndp
uci del dhcp.lan.dhcpv6
uci del dhcp.lan.ra_flags
uci add_list dhcp.lan.ra_flags='other-config'
uci set dhcp.lan.max_preferred_lifetime='900'
uci set dhcp.lan.max_valid_lifetime='1200'
uci set dhcp.lan.ra_maxinterval='600'
uci set dhcp.lan.ra_mininterval='200'
uci set dhcp.lan.ra_lifetime='900'
uci set dhcp.lan.ra_hoplimit='64'

uci commit dhcp
/etc/init.d/odhcpd restart
