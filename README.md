## step3 - software dependencies

### 1. Enable dependency scanning
```
- Go to Settings -> Security -> Code security and analysis 
- Enable Dependabot alerts
- Enable Dependabot security updates
```

### 2. Create dependabot yaml template

```
- Copy the contents of `.github/dependabot.yml.sample`
- Create a `.github/dependabot.yml` in the default branch (main)
- Identify your programming language(s)
- Add correspondent package ecosystems 
- Set location of requirements file (/app)
```

### 3. Define software out-dated libraries
Observe the [requirements.txt](samples/requirements.txt.sample) sample
```
- Open requirements.txt file in in the default branch (main)
- Confirm that is as outdated libraries (e.g. requests==2.23.0)
```

### 4. Check the default branch     
The default branch is typically `main` or `master` and is used to deploy to master. 
GitHub dependabot will look for vulnerable dependencies on default branches only!

You can check the current default branch on [settings](https://github.com/arainho/secure-git-workshop/settings/branches).   
Take a look on the [requirements.txt](https://github.com/arainho/secure-git-workshop/blob/main/app/requirements.txt) file in the main branch.   

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
