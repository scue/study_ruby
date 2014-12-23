#!/usr/bin/env ruby
# encoding: UTF-8
# crontab -e 
# * * * * * ~/webagent_ddns_update.rb
# 参考:
#   1. https://stackoverflow.com/questions/17177872/using-shove-to-add-a-string-to-an-array-in-ruby
#   2. http://www.rubydoc.info/github/sparklemotion/nokogiri

require 'nokogiri'
require 'open-uri'
require 'resolv'
require 'cgi'
require 'net/https'

username="fakesffake@yahoo.com"
password="fakesffake"
ddns="fake.ddns.net"                                     # 免费域名地址
webagent="http://webagent.fakesf.net.cn/ssl/unicom.php" # WebAgent地址

# 通过解析HTML文件获得VPN地址数组
def get_true_ip(webagent)
    vpnips=[]
    doc=Nokogiri::HTML(open(webagent))
    doc.xpath('///a').map do |link|
        vpnips << link.text
    end
    vpnips[0]
end

# 通过Socket解析出域名当前地址
def get_cur_ip(ddns)
    Resolv.getaddress(ddns)
end

vpncurip=get_cur_ip(ddns)
vpntrueip=get_true_ip(webagent)
noip_url="https://dynupdate.no-ip.com/nic/update?hostname=%s&myip=%s" % [ddns, vpntrueip]
if vpntrueip.eql?(vpncurip)
    puts "当前无需更新"
else
    puts "需要更新地址"
    open(noip_url, http_basic_authentication: [username, password]){|f| puts f.read }
end
