Vagrant.configure("2") do |config|
  config.vm.box = "fedora/34-cloud-base"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.network "forwarded_port", guest: 1389, host: 1389
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  config.vm.network "forwarded_port", guest: 9000, host: 9999

  config.vm.provision "shell", inline: <<-SHELL

    # update
    yum -y update

    # justfile
    dnf install just

    # ntp and timezone
    dnf install chrony
    systemctl enable chronyd
    systemctl start chronyd
    timedatectl set-timezone Europe/Lisbon
    timedatectl set-ntp yes

    # tools
    yum install fish curl htop iftop iotop git strace java-latest-openjdk.x86_64

    yum install -y podman
    groupadd -f -r podman
    #systemctl edit podman.socket
    mkdir -p /etc/systemd/system/podman.socket.d
    cat >/etc/systemd/system/podman.socket.d/override.conf <<EOF
[Socket]
SocketMode=0660
SocketUser=root
SocketGroup=podman
EOF
    systemctl daemon-reload
    echo "d /run/podman 0770 root podman" > /etc/tmpfiles.d/podman.conf
    sudo systemd-tmpfiles --create
    systemctl enable podman.socket
    systemctl start podman.socket
    #usermod -aG podman $SUDO_USER
    usermod -aG podman vagrant

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

  SHELL
end
