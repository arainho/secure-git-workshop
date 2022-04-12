# secure-git-workshop

## step8 - wait, I commit a secret!

1. Identify your secret
```
- Identify secrets that you app uses
- You can use grep and patterns
- Look manualy inside your repo for them
- Or you can use shhgit and trufflehog 
```

2. Remove file or file contens with secret
```
- rm -- "supersecrets.txt"
- sed -i 's/secure-password/API_SECRET/g' get_wheather.py
```

3. Remove file from history
```
- Check all branches for your secret
- Check all history for your secret
- Remove file completly from you repo
```

Your done 👍 move to step 8
```bash
git checkout step8
```
