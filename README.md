## step6 - container scanning

### 1. Enable container scanning
```
- Tools that scan outdated dependencies and packages inside containers
- We will use trivy from Aqua Security
```

### 2. Build the image
```bash
make build
```

### 3. Run the container scanning
We will use the [grype](https://github.com/anchore/grype) tool. 
However, you can use [trivy](https://github.com/aquasecurity/trivy) as well.
```bash
make container_scanning
```

### Your done 👍 move to final step
```bash
git checkout the-end
```
