$script = <<SCRIPT
    sudo yum -y install epel-release
    sudo yum -y update
    sudo yum -y install curl
    curl -L https://get.docker.com/ |sh
    sudo yum -y install wget
    sudo yum -y install tree
    sudo yum -y install git
    chown vagrant.vagrant -R /home/vagrant
    sudo service docker start
    sudo usermod -aG docker vagrant
    sudo chkconfig docker on
    sudo mkdir /opt/bin
    COMPOSE_VERSION=1.18.0
    sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose
    sudo chmod +x /opt/bin/docker-compose
    sudo mkdir /var/opt/mysql
    sudo chown vagrant:vagrant -R /var/opt/mysql
    sudo mkdir -p /home/vagrant/mysql/init
    sudo chown vagrant:vagrant -R /home/vagrant/mysql
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision "shell",
    inline: $script

end
