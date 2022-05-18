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
We will use the [trivy](https://github.com/aquasecurity/trivy) tool from Aqua. However, you can use other tools such as [grype](https://github.com/anchore/grype) from Anchore [[+]](https://github.com/marketplace/actions/anchore-container-scan)
```bash
make container_scanning
```

### Your done 👍 move to step 7
```bash
git checkout step7
```
