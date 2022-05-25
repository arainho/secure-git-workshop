### 1. Identify your secret
```
- Identify secrets that you app uses
- You can use grep and patterns
- Look manualy inside your repo for them
- Or you can use shhgit and trufflehog 
```

### 2. There is a secret inside the Code, now what ?
```
- Revoke your secret
- Generate a new one
- Save it in your local password manager (e.g. KeepassXC)
- Save it on a online password manager (e.g. 1Password)
- Os Save it your company secret management solution (e.g. Hashicorp Vault)
```

### 3. Remediation approaches
```
- Tell your collaborators to rebase, not merge
- Request GitHub Support to remove sensitive data in pull requests
- Test BFG tool / git filter-repo to avoid unintended side effects
```
[+removing-sensitive-data-from-a-repository](https://docs.github.com/cn/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository#)
