## step6 - container scanning

### 1. Enable container scanning
```
- Tools that scan outdated dependencies and packages inside containers
- We will use a tool called trivy from Aqua Security
- There are other options such as grype from Anchore
```

### 2. Build the image
```bash
docker build -t git-insecure-workshop:v1 .
```

### 3. Read the key to a local environment variable
Use a local environment variable
```bash
read -s API_KEY
``````

### 4. Spin up the container
```bash
docker run --env API_KEY="$API_KEY" git-insecure-workshop:v1
```

### 5. Run the container scanning
We will use the [trivy](https://github.com/aquasecurity/trivy) tool. 
However, you can use [grype](https://github.com/anchore/grype) running inside a github action. [[+]](https://github.com/marketplace/actions/anchore-container-scan)
```bash
make container_scanning
```

### Your done 👍 move to step 7
```bash
git checkout step7
```
