# secure-git-workshop

## step3 - software dependencies

1. Enable dependency scanning
```
- Go to Settings -> Security -> Code security and analysis 
- Enable Dependabot alerts
- Enable Dependabot security updates
```

2. Create dependabot yaml template
```
- Copy dependabot.yml.sample to .github/dependabot.yml
- identify your programming language(s)
- Add correspondent package ecosystems 
```

3. Define software out-dated libraries
```
- create requirements.txt file
- Define software outdated libraries (e.g. requests==2.23.0)
```

4. Observe alerts and pull requests
```
- View and analyse the dependabot alerts
- View and approve pull requests
```

Your done 👍 move to step 4
```bash
git checkout step4
```
