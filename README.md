## setup lab ... 🧰 ⛏️🔧🪛

### 1. Required accounts
The required accounts to complete the workshop are:
```
- GitHub
- OpenWeatherMap 
```

Signup GitHub and fork the workshop repository
```
- https://github.com/signup
- https://github.com/arainho/secure-git-workshop/fork
```

Signup and create key for OpenWeatherMap
```
- https://home.openweathermap.org/users/sign_up
- https://home.openweathermap.org/api_keys)   
```

### 2. Install requirements
In terms of tools you need the following:
```
- git
- make
- docker
- python3	
- curl
- jq
- bat (optional)
```

For git, make and docker go to:
- https://git-scm.com/downloads
- https://command-not-found.com/make
- https://docs.docker.com/get-docker/


For the remaining tools execute:
```bash
make verify || make setup
```

### 3. Choose your machine

#### Option A - Your Laptop
The adviced operating systems are _macOS or Linux_ with `bash` or `zsh` shell.    

#### Option B - Linux VM  
If you have a machine with MS Windows, this is the advised path to proceed.   
All the software is pre-installed with the appropriate versions in the provided [Vagrant Box](Vagrantfile).     

Download and install VirtualBox and Vagrant:
```
www.virtualbox.org/wiki/Downloads
www.vagrantup.com/downloads
```

Start the vagrant box with:
```bash
vagrant up --provider virtualbox
vagrant ssh
```

### let's [start](https://github.com/arainho/secure-git-workshop/tree/start) [🚀](https://github.com/arainho/secure-git-workshop/tree/start)
