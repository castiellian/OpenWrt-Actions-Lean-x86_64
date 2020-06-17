#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# 定制默认IP
sed -i 's/192.168.1.1/192.168.1.8/g' package/base-files/files/bin/config_generate

# 替换默认Argon主题
rm -rf package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

# 添加第三方软件包
git clone https://github.com/vernesong/OpenClash package/OpenClash
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/kang-mk/luci-app-smartinfo package/luci-app-smartinfo
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter




#创建自定义配置文件 - OpenWrt-x86_64

rm -f ./.config*
touch ./.config

#
# ========================固件定制部分========================
# 

# 
# 如果不对本区块做出任何编辑, 则生成默认配置固件. 
# 

# 以下为定制化固件选项和说明:
#

#
# 有些插件/选项是默认开启的, 如果想要关闭, 请参照以下示例进行编写:
# 
#          =========================================
#         |  # 取消编译VMware镜像:                   |
#         |  cat >> .config <<EOF                   |
#         |  # CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#

# 
# 以下是一些提前准备好的一些插件选项.
# 直接取消注释相应代码块即可应用. 不要取消注释代码块上的汉字说明.
# 如果不需要代码块里的某一项配置, 只需要删除相应行.
#
# 如果需要其他插件, 请按照示例自行添加.
# 注意, 只需添加依赖链顶端的包. 如果你需要插件 A, 同时 A 依赖 B, 即只需要添加 A.
# 
# 无论你想要对固件进行怎样的定制, 都需要且只需要修改 EOF 回环内的内容.
# 

# 编译x86_64固件:
cat >> .config <<EOF
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
CONFIG_EFI_IMAGES=y
# CONFIG_GRUB_CONSOLE is not set
CONFIG_GRUB_TITLE="OpenWrt AutoBuild by Castielian"
CONFIG_KERNEL_BUILD_USER="Castielian"
CONFIG_LIBCURL_COOKIES=y
CONFIG_LIBCURL_FILE=y
CONFIG_LIBCURL_FTP=y
CONFIG_LIBCURL_HTTP=y
CONFIG_LIBCURL_NO_SMB="!"
CONFIG_LIBCURL_OPENSSL=y
CONFIG_LIBCURL_PROXY=y
CONFIG_NFS_KERNEL_SERVER_V4=y
CONFIG_NODEJS_ICU_NONE=y
CONFIG_OPENSSL_WITH_CAMELLIA=y
CONFIG_OPENSSL_WITH_COMPRESSION=y
CONFIG_OPENSSL_WITH_DTLS=y
CONFIG_OPENSSL_WITH_EC2M=y
CONFIG_OPENSSL_WITH_GOST=y
CONFIG_OPENSSL_WITH_IDEA=y
CONFIG_OPENSSL_WITH_MDC2=y
CONFIG_OPENSSL_WITH_NPN=y
CONFIG_OPENSSL_WITH_RFC3779=y
CONFIG_OPENSSL_WITH_SEED=y
CONFIG_OPENSSL_WITH_WHIRLPOOL=y
CONFIG_PACKAGE_UnblockNeteaseMusic=y
CONFIG_PACKAGE_UnblockNeteaseMusicGo=y
CONFIG_PACKAGE_adb=y
CONFIG_PACKAGE_adb-enablemodem=y
CONFIG_PACKAGE_adblock=y
CONFIG_PACKAGE_appfilter=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_bind-client=y
CONFIG_PACKAGE_bind-libs=y
CONFIG_PACKAGE_brook=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_chat=y
CONFIG_PACKAGE_chinadns-ng=y
CONFIG_PACKAGE_comgt=y
CONFIG_PACKAGE_comgt-directip=y
CONFIG_PACKAGE_comgt-ncm=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_nsupdate=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y
CONFIG_PACKAGE_dns2socks=y
CONFIG_PACKAGE_dnsmasq_full_auth=y
CONFIG_PACKAGE_dnsmasq_full_conntrack=y
CONFIG_PACKAGE_dnsmasq_full_dnssec=y
CONFIG_PACKAGE_frpc=y
CONFIG_PACKAGE_grub2-efi=y
CONFIG_PACKAGE_haproxy=y
# CONFIG_PACKAGE_iptables-mod-ipsec is not set
CONFIG_PACKAGE_kcptun-client=y
CONFIG_PACKAGE_kmod-atm=y
CONFIG_PACKAGE_kmod-crypto-cts=y
# CONFIG_PACKAGE_kmod-crypto-deflate is not set
# CONFIG_PACKAGE_kmod-crypto-echainiv is not set
# CONFIG_PACKAGE_kmod-crypto-rng is not set
# CONFIG_PACKAGE_kmod-crypto-sha256 is not set
# CONFIG_PACKAGE_kmod-crypto-wq is not set
CONFIG_PACKAGE_kmod-dax=y
CONFIG_PACKAGE_kmod-dm=y
CONFIG_PACKAGE_kmod-dnsresolver=y
CONFIG_PACKAGE_kmod-fs-exportfs=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-common-rpcsec=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-nfsd=y
CONFIG_PACKAGE_kmod-gre=y
# CONFIG_PACKAGE_kmod-ipsec is not set
# CONFIG_PACKAGE_kmod-ipt-ipsec is not set
CONFIG_PACKAGE_kmod-iptunnel=y
# CONFIG_PACKAGE_kmod-iptunnel6 is not set
CONFIG_PACKAGE_kmod-irqbypass=y
CONFIG_PACKAGE_kmod-kvm-amd=y
CONFIG_PACKAGE_kmod-kvm-intel=y
CONFIG_PACKAGE_kmod-kvm-x86=y
CONFIG_PACKAGE_kmod-l2tp=y
CONFIG_PACKAGE_kmod-macvlan=y
CONFIG_PACKAGE_kmod-oaf=y
CONFIG_PACKAGE_kmod-pppoa=y
CONFIG_PACKAGE_kmod-pppol2tp=y
CONFIG_PACKAGE_kmod-pptp=y
CONFIG_PACKAGE_kmod-udptunnel4=y
CONFIG_PACKAGE_kmod-udptunnel6=y
CONFIG_PACKAGE_kmod-usb-acm=y
CONFIG_PACKAGE_kmod-usb-atm=y
CONFIG_PACKAGE_kmod-usb-cm109=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-yealink=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usbip=y
CONFIG_PACKAGE_kmod-usbip-client=y
CONFIG_PACKAGE_kmod-usbip-server=y
CONFIG_PACKAGE_kmod-usbmon=y
CONFIG_PACKAGE_libatomic=y
CONFIG_PACKAGE_libcap=y
CONFIG_PACKAGE_libcares=y
CONFIG_PACKAGE_libcurl=y
CONFIG_PACKAGE_libdevmapper=y
CONFIG_PACKAGE_libhttp-parser=y
CONFIG_PACKAGE_libkeyutils=y
CONFIG_PACKAGE_libltdl=y
CONFIG_PACKAGE_libnetfilter-conntrack=y
CONFIG_PACKAGE_libnettle=y
CONFIG_PACKAGE_libnfnetlink=y
CONFIG_PACKAGE_libnghttp2=y
CONFIG_PACKAGE_librpc=y
CONFIG_PACKAGE_libtirpc=y
CONFIG_PACKAGE_libusb-1.0=y
CONFIG_PACKAGE_libuv=y
CONFIG_PACKAGE_libwebsockets-full=y
CONFIG_PACKAGE_libwrap=y
CONFIG_PACKAGE_linux-atm=y
CONFIG_PACKAGE_luci-app-adblock=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-clash=y
CONFIG_PACKAGE_luci-app-frpc=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-mwan3helper=y
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Socks=y
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-unblockmusic=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic-go=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic-mini=y
# CONFIG_PACKAGE_luci-app-v2ray-server is not set
CONFIG_PACKAGE_luci-app-webadmin=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-i18n-adblock-zh-cn=y
CONFIG_PACKAGE_luci-i18n-mwan3-zh-cn=y
CONFIG_PACKAGE_luci-i18n-mwan3helper-zh-cn=y
CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y
CONFIG_PACKAGE_luci-i18n-smartdns-zh-cn=y
CONFIG_PACKAGE_luci-i18n-ttyd-zh-cn=y
CONFIG_PACKAGE_luci-i18n-webadmin-zh-cn=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-argon-dark-mod=y
CONFIG_PACKAGE_luci-theme-argon-light-mod=y
CONFIG_PACKAGE_luci-theme-material=y
CONFIG_PACKAGE_luci-theme-netgear=y
CONFIG_PACKAGE_mwan3=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_nfs-kernel-server=y
CONFIG_PACKAGE_nfs-utils-libs=y
CONFIG_PACKAGE_node=y
CONFIG_PACKAGE_portmap=y
CONFIG_PACKAGE_ppp-mod-passwordfd=y
CONFIG_PACKAGE_ppp-mod-pppoa=y
CONFIG_PACKAGE_ppp-mod-pppol2tp=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_ppp-mod-radius=y
CONFIG_PACKAGE_resolveip=y
CONFIG_PACKAGE_rpcbind=y
CONFIG_PACKAGE_shadowsocks-libev-ss-local=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-local=y
CONFIG_PACKAGE_smartdns=y
CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_srelay=y
# CONFIG_PACKAGE_strongswan is not set
# CONFIG_PACKAGE_strongswan-charon is not set
# CONFIG_PACKAGE_strongswan-ipsec is not set
# CONFIG_PACKAGE_strongswan-minimal is not set
# CONFIG_PACKAGE_strongswan-mod-aes is not set
# CONFIG_PACKAGE_strongswan-mod-gmp is not set
# CONFIG_PACKAGE_strongswan-mod-hmac is not set
# CONFIG_PACKAGE_strongswan-mod-kernel-netlink is not set
# CONFIG_PACKAGE_strongswan-mod-nonce is not set
# CONFIG_PACKAGE_strongswan-mod-pubkey is not set
# CONFIG_PACKAGE_strongswan-mod-random is not set
# CONFIG_PACKAGE_strongswan-mod-sha1 is not set
# CONFIG_PACKAGE_strongswan-mod-socket-default is not set
# CONFIG_PACKAGE_strongswan-mod-stroke is not set
# CONFIG_PACKAGE_strongswan-mod-updown is not set
# CONFIG_PACKAGE_strongswan-mod-x509 is not set
# CONFIG_PACKAGE_strongswan-mod-xauth-generic is not set
# CONFIG_PACKAGE_strongswan-mod-xcbc is not set
CONFIG_PACKAGE_tcping=y
CONFIG_PACKAGE_ttyd=y
CONFIG_PACKAGE_uclibcxx=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_wwan=y
CONFIG_RPCBIND_LIBWRAP=y
CONFIG_RPCBIND_RMTCALLS=y
CONFIG_TARGET_IMAGES_GZIP=y
CONFIG_TARGET_ROOTFS_PARTSIZE=300


EOF
# 
# ========================固件定制部分结束========================
# 


sed -i 's/^[ \t]*//g' ./.config

# 配置文件创建完成
