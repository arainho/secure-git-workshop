## step3 - software dependencies

### 1. Enable dependency scanning
```
- Go to Settings -> Security -> Code security and analysis 
- Enable Dependabot alerts
- Enable Dependabot security updates
```

### 2. Create dependabot yaml template
```
- Copy `samples/dependabot.yml.sample` to `.github/dependabot.yml`
- Identify your programming language(s)
- Add correspondent package ecosystems 
```

### 3. Define software out-dated libraries
```
- Create requirements.txt file
- Define software outdated libraries (e.g. requests==2.23.0)
```

### 4. Set the default branch
```
- Define step3 as your default branch
```

### 5. Observe alerts and pull requests
```
- Wait some minutes
- View and analyse the dependabot alerts
- View and approve pull requests
```

### 6. Run dependency scan locally (optional)
```
make dependency_scan
```

### Your done 👍 move to step 4
```bash
git checkout step4
```
