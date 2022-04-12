# secure-git-workshop

## step8 - wait, I commit a secret!

1. Identify your secret
```
- Identify secrets that you app uses
- You can use grep and patterns
- Look manualy inside your repo for them
- Or you can use shhgit and trufflehog 
```

2. There is a secret inside the Code, now what ?
```
- Revoke your secret
- Generate a new one
- Save it in your local password manager (e.g. KeepassXC)
- Save it on a online password manager (e.g. 1Password)
- Os Save it your company secret management solution (e.g. Hashicorp Vault)
```

3. Remove a file or content with the secret
```
- rm -- "supersecrets.txt"
- sed -i 's/secure-password/API_SECRET/g' get_wheather.py
```

3. Remove file from git history
```
- Check all branches for your secret
- Check all history for your secret
- Remove file completly from you repo
```

Your done 👍 move to step 9
```bash
git checkout step9
```
