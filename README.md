## step6 - container scanning

### 1. Enable container scanning
```
- Tools that scan outdated dependencies and packages inside containers
- We will use Aqua trivy and Anchore grype
```

### 2. Build the image
```bash
docker build -t git-insecure-workshop:v1 .
```

### 3. Read the key to an environment variable
```bash
read -s API_KEY
docker run --env API_KEY="$API_KEY" git-insecure-workshop:v1
```

### 4. Spin up the container
```bash
read -s API_KEY
docker run --env API_KEY="$API_KEY" git-insecure-workshop:v1
```

### 5. Run the container scanning
```bash
make container_scanning
```

### 6. Storing and delivering secrets
Articles with secret management alternatives (pros and cons)    
- [ec2-user-data-secret ](https://filip5114.github.io/ec2-user-data-secret)   
- [why-you-shouldnt-use-env-variables-for-secret-data](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data)   
- [ways to store secrets in your app](https://medium.com/poka-techblog/the-best-way-to-store-secrets-in-your-app-is-not-to-store-secrets-in-your-app-308a6807d3ed)    


### Your done 👍 move to step 7
```bash
git checkout step7
```
