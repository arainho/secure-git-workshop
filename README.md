## step7 - wait, I commit a secret!

### 1. Commit dummy secrets
```bash
echo username:password | rev >> supersecrets.txt
echo AKIAIOSFODNN7EXAMPLE | rev >> supersecrets.txt
```

```bash
git add supersecrets.txt
git commit -m "new secrets" 
```

### 2. Remove a file or any content with the secret
```bash
rm -- "supersecrets.txt"
git rm supersecrets.txt && git commit -m "remove file with secrets"
```

```bash
make fix
git add get_wheather.py && git commit -m "remove content with secrets"
```

### 3. Prevent future commits
```
echo supersecrets.txt >> .gitignore
echo "YOUR_FILE_WITH_SENSITIVE_DATA" >> .gitignore
```

### 4. Purge file from all commits and branches
```
(bfg --delete-files supersecrets.txt | SENSITIVE_FILE=supersecrets.txt make delete)
```

[+more details](step7-details.md)

### Your done 👍 move to step8
```bash
git checkout step8
```
