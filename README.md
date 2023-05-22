## setup lab ... 🧰 ⛏️🔧🪛

### 1. Required accounts
The required accounts to complete the workshop are:
```
- GitHub
- OpenWeatherMap
- Docker Hub
```

Signup GitHub and fork the workshop repository
```
- https://github.com/signup
- https://github.com/arainho/secure-git-workshop/fork
```

Signup and create key for OpenWeatherMap
```
- https://home.openweathermap.org/users/sign_up
- https://home.openweathermap.org/api_keys 
```

Signup and create token for Docker Hub
```
- https://hub.docker.com/signup
- https://hub.docker.com/settings/security?generateToken=true
```

Signup SonarCloud, create a organization, plus a project and generate a token
```
https://www.sonarsource.com/products/sonarcloud/signup
https://sonarcloud.io/create-organization
https://sonarcloud.io/projects/create
https://sonarcloud.io/account/security
```

### 2. Choose your machine

#### Option A - Your Laptop
The adviced operating systems are _macOS or Linux_ with `bash` or `zsh` shell.  
Move to item 3. Install requirements.

#### Option B - Linux VM  
If you have a machine with MS Windows, this is the advised path to proceed.   
All the software is pre-installed with the appropriate versions in the provided [Vagrant Box](Vagrantfile).   
Skip item 3. Install requirements.    

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

### 3. Install requirements
This is only required for option A - your Laptop.   
The required tools are the following:     
```
- git *
- make *
- docker *
- python3
- openjdk 18
- curl
- jq
- bat (optional)
```

Download and install git, make, docker, python, openjdk, curl and jq:
```
- https://git-scm.com/downloads
- https://command-not-found.com/make
- https://docs.docker.com/get-docker/
- https://www.python.org/downloads/
- https://adoptopenjdk.net
- https://command-not-found.com/curl
- https://command-not-found.com/jq
```

### let's [start](https://github.com/arainho/secure-git-workshop/tree/start) [🚀](https://github.com/arainho/secure-git-workshop/tree/start)
