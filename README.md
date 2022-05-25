## step7 - wait, I commit a secret!

### 1. Commit file with dummy secrets
```bash
echo username:password | rev > supersecrets.txt
echo AKIAIOSFODNN7EXAMPLE | rev >> supersecrets.txt
```

```bash
git add supersecrets.txt
git commit -m "new secrets" 
```

### 2. Remove the secrets
Remove the whole file
```bash
rm -- "supersecrets.txt"
git rm supersecrets.txt && git commit -m "remove file with secrets"
```

Or remove just specific content
```bash
make fix
git add get_wheather.py && git commit -m "remove content with secrets"
```

### 3. Purge file from all commits and branches
```bash
FILE_WITH_SECRETS=supersecrets.txt make delete
```

### 4. Prevent future commits
```
echo supersecrets.txt >> .gitignore
echo "YOUR_FILE_WITH_SENSITIVE_DATA" >> .gitignore
```

[+more details](step7-details.md)

### Your done 👍 move to step8
```bash
git checkout step8
```
