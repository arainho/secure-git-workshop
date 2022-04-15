# secure-git-workshop

## step9 - wait, I upload a container with a secret!

0. Setup Github actions
```
[Open]       https://github.com/arainho/git-insecure-workshop/actions/new
[Click]       set up a workflow yourself
```

1. Identify your secret
```
- Identify Dockerfile with secrets 
- Look inside your Dockefile for them
- Or you can use shhgit and trufflehog 
```

2. There is a secret inside the Dockerfile, now what ?
```
- Revoke your secret
- Generate a new one
- Save it in your local password manager (e.g. KeepassXC)
- Save it on a online password manager (e.g. 1Password)
- Os Save it your company secret management solution (e.g. Hashicorp Vault)
```

3. Cleanup compromized Dockerfile
```
- Remove Dockerfile file from repo
- Remove it from git history 
- Create a shasum of compromised Dockerfile
- Search and remove files with that hash from CI/CD systems and Buckets
- Remove and block compromized container versions in Container registries ( Cloud and on-prem )
-- Create a new tag for Dockerfile sanitized version 
-- Scan Dockerfile with secret detection and container scanning tools 
```

4. Remove container from docker hub
```
- Remove all the container images (advised)
- Or remove just specific tags with the secret (more work, more risky) 
```

5. Check if your content is saved online
```
- We never know if someone saved the content or not!
- Check number of downloads of your image
- Verify existence of container in the Internet Archive, Wayback Machine 
```

Your done 👍 move to step 10 
```bash
git checkout step10
```
