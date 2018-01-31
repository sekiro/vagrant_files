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
    export COMPOSE_VERSION=1.18.0
    sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose
    sudo chmod +x /opt/bin/docker-compose
    sudo docker pull mysql
    sudo docker pull busybox