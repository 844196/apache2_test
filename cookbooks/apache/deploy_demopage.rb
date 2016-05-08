package 'php5'

execute 'add www-data group' do
  command <<-EOS
    usermod -G www-data vagrant
  EOS
end

execute 'deploy demopage' do
  user 'vagrant'
  cwd '/home/vagrant'
  command <<-EOS
    mkdir webroot
    printf '<?php\nphpinfo();\n' > webroot/index.php
  EOS
end

execute 'set file permission' do
  command <<-EOS
    chgrp -R www-data webroot
  EOS
end

remote_file '/etc/apache2/sites-available/phpinfo.conf'

execute 'siteconf load' do
  command <<-EOS
    a2ensite phpinfo
  EOS
end

service 'apache2' do
  action :restart
end
