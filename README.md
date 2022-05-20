## step8 - wait, I upload a container with a secret!

### 0. Setup Github workflow
Open URL and set up a workflow and actions yourself
```
https://github.com/arainho/git-insecure-workshop/actions/new 
```

### 1. Setup Github secrets   
Open URL and define the variables DOCKERHUB_USERNAME and DOCKERHUB_TOKEN
```
https://github.com/arainho/git-insecure-workshop/settings/secrets/actions
```

### 2. Run the workflow
The workflow definition with docker build and push steps is on [docker-image.yml](https://github.com/arainho/secure-git-workshop/blob/step8/.github/workflows/docker-image.yml).
After the workflow finishes, a docker image will be uploaded to your docker hub.
```
https://hub.docker.com/r/arainho/git-insecure-workshop
```

### 4. Or push the image manually (optional)
```bash
read -s DOCKER_USERNAME
read -s DOCKER_TOKEN
THE_USER="${DOCKER_USERNAME}" TOKEN="${DOCKER_TOKEN}" make push
```

### 4. Identify your secret
```
- Manually identify Dockerfile with secrets 
- Or you can use shhgit and trufflehog 
```

Check if the layers of the image uploaded to Docker Hub have your secret [[+](https://hub.docker.com/layers/git-insecure-workshop/arainho/git-insecure-workshop/latest/images/sha256-df67b5c0bbec601c99f89bb024ce12abc035994ad88a9e7df82c534975677cf9?context=repo)]


### 5. There is a secret inside the Dockerfile, now what ?
```
- Revoke your secret
- Generate a new one
- Save it in your local password manager (e.g. KeepassXC)
- Or save it on a online password manager (e.g. 1Password)
- Os save it your company secret management solution (e.g. Hashicorp Vault)
```

### 6. Cleanup the compromised Dockerfile
```
- Remove the Dockerfile file from the repository
- The rm and git rm are not enough!... remove it from git history!
- Create a shasum of compromised Dockerfile
- Search and remove files with that hash from CI/CD systems and Buckets
- Remove and block compromised container versions in Container registries ( Cloud and on-prem )
-- Create a new tag for Dockerfile sanitized version 
-- Scan Dockerfile with secret detection and container scanning tools 
```

### 7. Remove container from docker hub
```
- Remove all the container images (advised)
- Or remove just specific images tags with the secret (more work, more risk!) 
```

### 8. Check if your content is saved online
```
- We never know if someone saved the content or not!
- Check number of downloads of your image
- Verify existence of container in the Internet Archive, Wayback Machine 
```

### Your done 👍 move to step 9
```bash
git checkout step9
```
