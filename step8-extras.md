### 1. Cleanup the compromised Dockerfile
```
- Remove the Dockerfile file from the repository
- The rm and git rm are not enough!... remove it from git history!
- Create a shasum of compromised Dockerfile
- Search and remove files with that hash from CI/CD systems and Buckets
- Remove and block compromised container versions in Container registries ( Cloud and on-prem )
-- Create a new tag for Dockerfile sanitized version 
-- Scan Dockerfile with secret detection and container scanning tools 
```

### 2. Remove image from the container registry
```
- Identify your container registries (DockerHub, AWS ECR, GCP Container registry, other)
- Remove the specific images tags with the secret
- Test all your app images from the registries
```

### 3. Other considerations
```
- Are your registries private or public?
- Is the affected image in use on a running container?
- Check the number of downloads of your image at DockerHub or other registries
- Verify the existence of the container in the Internet Archive, Wayback Machine
```

If the images are in a public registry, then we never know if someone saved the content or not!
So revoking the secrets is crucial in these cases.
