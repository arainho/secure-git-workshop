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

### Your done 👍 move to step 7
```bash
git checkout step7
```
