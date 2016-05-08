# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network 'private_network', :ip => '192.168.33.10'

  # set timezone
  config.vm.provision 'shell', :privileged => true, :inline => <<-SHELL
    timedatectl set-timezone Asia/Tokyo
  SHELL

  # configure apt repositories
  config.vm.provision 'shell', :privileged => true, :inline => <<-SHELL
    sed -i.bak \
      -e 's%http://archive.ubuntu.com/ubuntu%http://ftp.jaist.ac.jp/pub/Linux/ubuntu%g' \
      -e 's%http://security.ubuntu.com/ubuntu%http://ftp.jaist.ac.jp/pub/Linux/ubuntu%g' \
      /etc/apt/sources.list
    yes '' | add-apt-repository ppa:brightbox/ruby-ng
    apt-get update
  SHELL

  # base setup
  config.vm.provision 'shell', :privileged => true, :inline => <<-SHELL
    apt-get install -y ruby2.3 ruby2.3-dev g++
    gem install itamae
  SHELL

  # cook do
  config.vm.provision 'shell', :privileged => true, :inline => <<-SHELL
    itamae local /vagrant/setup_apache.rb /vagrant/deploy_demopage.rb
  SHELL
end
