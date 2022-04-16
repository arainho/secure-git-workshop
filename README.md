# secure-git-workshop

## step4 - static analysis

1. Enable static analysis
```
- Also know as SAST
- ... 
```

2. Create SonarCloud account and organization
```
https://sonarcloud.io/projects/create
https://sonarcloud.io/create-organization
```

```
- create an organization manualy
- give it a name xyz-workshops
- choose free plan and click create
```

3. Create a new project and generate a token
```
https://sonarcloud.io/projects/create
For project key choose git-secure-workshop

- Add secret called SONAR_TOKEN
```

4. Setup Analysis on CI
```
https://sonarcloud.io/project/configuration?id=git-secure-workshop&analysisMode=GitHubOtherCI
```

Your done 👍 move to step 5
```bash
git checkout step5
```
