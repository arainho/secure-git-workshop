Vagrant.configure("2") do |config|
  config.vm.box = "fedora/34-cloud-base"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 7000, host: 7000
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  config.vm.provision "shell", inline: <<-SHELL

    # update
    dnf -y update

    # ntp and timezone
    dnf -y install chrony
    systemctl enable chronyd
    systemctl start chronyd
    timedatectl set-timezone Europe/Lisbon
    timedatectl set-ntp yes

    # tools
    dnf -y install htop iftop iotop \
	   strace just vim \
           bash zsh fish perl-Digest-SHA
    dnf -y install git make python3 java-latest-openjdk curl jq bat 

    # docker
    dnf -y install dnf-plugins-core
    dnf config-manager --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo
    dnf -y install docker-ce docker-ce-cli containerd.io
    systemctl enable docker
    systemctl start docker
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
	 -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    groupadd docker
    usermod -aG docker vagrant

    # security tools
    curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
    curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.18.3
    
    # pull required images
    docker pull owasp/dependency-check
    docker pull anchore/grype
    docker pull aquasec/trivy

  SHELL
end
