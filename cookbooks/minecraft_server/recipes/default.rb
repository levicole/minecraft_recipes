user 'minecraft' do
  home '/home/minecraft'
end

directory '/var/minecraft/' do
  owner "minecraft"
end

remote_file '/var/minecraft/minecraft_server.jar' do
  mode "0700"
  owner "minecraft"
  source "https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar"
end

template "/etc/init.d/minecraft_server" do
  mode "0755"
  source "minecraft_server"
  owner "root"
end

service "minecraft_server" do
  supports :status => true, :start => true, :restart => true
  action :start
end
