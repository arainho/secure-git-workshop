## step6 - container scanning

### 1. Enable container scanning
```
- Tools that scan outdated dependencies and packages inside containers
- We will use trivy from Aqua Security
```

### 2. Build the image
```bash
docker build -t localbuild/git-insecure-workshop:v1 .
```

### 3. Read the key to a local environment variable
Use a local environment variable
```bash
read -s API_KEY
``````

### 4. Test the app locally
```bash
API_KEY=$API_KEY python3 get_wheather.py Aveiro
```

### 5. Spin up the container
```bash
docker run --env API_KEY="$API_KEY" localbuild/git-insecure-workshop:v1
```

### 6. Run the container scanning
We will use the [trivy](https://github.com/aquasecurity/trivy) tool. 
However, you can use [grype](https://github.com/anchore/grype) running inside a github action. [[+]](https://github.com/marketplace/actions/anchore-container-scan)
```bash
make container_scanning
```

### Your done 👍 move to step 7
```bash
git checkout step7
```
