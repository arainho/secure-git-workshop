# secure-git-workshop

## step10 - Leaks and breaches 

### GitBleed

```
- people have accidentally checked GitHub credentials into GitHub commits
- mostly a username and password in the commit author fields
```
More at [gitbleed](https://www.notgitbleed.com/gitbleed)

### Bleed it locally ...
```bash
git config user.email "HARDCODED ... ⚡⚡⚡ secure-password"
git config user.name "Gitbleed demo" 
```

### Will I or my business be affected?
#### 1. Manual approach
Check current metadata (name + email)
```bash
git config --get user.name        
git config --get user.email
```

Check metadata history
```bash
git log | grep Author | grep -v @
git log --pretty="%an <%ae>" | sort | uniq
```

#### 2. Automated approach
```
- Create a new dedicated CI/CD pipeline
- Build a script that uses GitHub API
- Search committer name and email
- Save them in a file per repo
- Use secret detection tools to scan those files
- Alert through email, slack
```

You finish the workshop, congrats! 🎉 
