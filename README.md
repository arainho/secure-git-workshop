## step4 - static analysis

### 1. What is static analysis ?
```
- Static Application Security Testing (SAST)
- Analyze application source code, byte code and binaries for coding and design conditions that are indicative of security vulnerabilities.
```

### 2. Create SonarCloud account and organization
```
https://www.sonarsource.com/products/sonarcloud/signup
https://sonarcloud.io/create-organization
```

```
- create an organization manualy
- give it a name xyz-workshops
- choose free plan and click create
```

### 3. Create a new project and generate a token
```
https://sonarcloud.io/projects/create.          # For project key choose secure-git-workshop

https://sonarcloud.io/account/security
```

### 4. Setup analysis
```
https://sonarcloud.io/project/configuration?id=git-secure-workshop
```

```
- Choose Analyze with a GitHub Action
- Follow instructions to create a GitHub Secret and Workflow
- Copy SONAR_TOKEN and add it to GitHub actions secrets
- Create a GitHub workflow file .github/workflows/build.yml
- Create a sonar-project.properties as described
```

### 5. Check the analysis results
```
https://sonarcloud.io/summary/new_code?id=git-secure-workshop&branch=step4
```

### Your done 👍 move to step 5
```bash
git checkout step5
```
