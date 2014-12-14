#!/usr/bin/env ruby
# encoding: UTF-8

require 'pty'
require 'find'
require 'expectr'

user_password="fakesf"
mysql_password="123456"
emmi_dir="/home/fakesf/emmfsrv"
emmi_curr='/home/fakesf/web_emmi_current_version.txt'
#web_emmi_path="/home/fakesf/emmfsrv/R3/20141210/SSLEMM_M65_WEB_16508_20141210.emmi"

# 获得更新
def find_emmi(emmi_dir)
    web_emmi_array=[]
    Find.find(emmi_dir) do |file|
        #puts file if File.basename(file) =~ /.*WEB.*\.emmi$/
        if File.basename(file) =~ /.*WEB.*\.emmi$/
            web_emmi_array.push(file)
        end
    end
    web_emmi_array.sort!
    web_emmi_array[-1]
end

# 执行升级
def emm_web_update(web_emmi_path, user_password, mysql_password, emmi_curr)
    runcmd = "sudo %s" % web_emmi_path
    exp = Expectr.new(runcmd, flush_buffer: true)
    exp.expect("[sudo]")
    exp.puts(user_password)
    exp.expect("Enter password:")
    exp.puts(mysql_password)
    exp.interact!(blocking: true)
    File.open(emmi_curr, "w") do |f|
        f.puts web_emmi_path
    end
end

web_emmi_path=find_emmi(emmi_dir)
if not File.exist?(emmi_curr)
    File.open(emmi_curr, "w+") {}
    emm_web_update(web_emmi_path,user_password,mysql_password,emmi_curr)
else
    curr_emmi_version = File.open(emmi_curr, "r").first.chop
    if curr_emmi_version.eql? web_emmi_path
        puts "当前版本[%s]已最新!" % curr_emmi_version
    else
        emm_web_update(web_emmi_path,user_password,mysql_password,emmi_curr)
    end
end
