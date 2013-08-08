#
# Cookbook Name:: sample
# Recipe:: default
#
# Copyright 2013, bpsinc
#
# All rights reserved - Do Not Redistribute
#

targetdir="/tmp/sampledir"
# こうじゃなくて
#unless File.directory?(targetdir)
#  Dir.mkdir(targetdir,0755)
#  File.chown(65534,3,targetdir)
#end
#
# こうだ
directory targetdir do
  owner "nobody"
  group "sys"
  mode "0755"
end
#ドヤァァ

# sample userを作成
sampleuser="sample"
user sampleuser do
  comment "sample user"
  home "/home/#{sampleuser}"
  supports :manage_home => true
  shell "/bin/bash"
  action :create
end

# git のインストール
package "git" do
  action :install
end

# template
# erbは => cookbooks/sample/templates/default/sample_template.erb
template "/tmp/sample_template" do
  owner "root"
  group "root"
  mode "0644"
end
