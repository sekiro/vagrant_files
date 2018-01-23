$script = <<SCRIPT
    sudo yum -y install epel-release
    sudo yum -y update
    sudo yum -y install curl
    curl -L https://get.docker.com/ |sh
    sudo yum -y install wget
    sudo yum -y install tree
    sudo yum -y install git
    sudo git clone https://github.com/creationix/nvm.git /home/vagrant/.nvm && cd /home/vagrant/.nvm && git checkout `git describe --abbrev=0 --tags`
    sudo source ~/.nvm/nvm.sh
    chown vagrant.vagrant -R /home/vagrant
    sudo service docker start
    sudo usermod -aG docker vagrant
    sudo chkconfig docker on
    sudo docker pull mysql
    sudo docker pull busybox
    sudo docker run -v /var/lib/mysql --name mysql_data busybox
    sudo docker run --volumes-from mysql_data --name mysql -e MYSQL_ROOT_PASSWORD=mysql -d -p 3306:3306 mysql

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision "shell",
    inline: $script

end
