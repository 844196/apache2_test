package 'apache2'

remote_file '/etc/apache2/apache2.conf'

execute 'disable apache default page' do
  command <<-EOS
    a2dissite 000-default.conf
  EOS
end

service 'apache2' do
  action :restart
end
