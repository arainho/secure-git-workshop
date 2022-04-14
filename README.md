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

3. Remediation approaches
```
- Tell your collaborators to rebase, not merge
- Request GitHub Support to remove sensitive data in pull requests
- Test BFG tool / git filter-repo to avoid unintended side effects
```
[+details](https://docs.github.com/cn/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository#)

3. Remove a file or any content with the secret
```
- rm -- "supersecrets.txt"
- sed -i 's/secure-password/API_SECRET/g' get_wheather.py
```

4. Prevent future commits
```
echo supersecrets.txt >> .gitignore
echo "YOUR_FILE_WITH_SENSITIVE_DATA" >> .gitignore
```

4. Purge file from all commits and branches
```
(bfg --delete-files supersecrets.txt | SENSITIVE_FILE=supersecrets.txt make delete)
```

Your done 👍 move to step 9
```bash
git checkout step9
```
