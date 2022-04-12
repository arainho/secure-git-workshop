# secure-git-workshop

## step2 - pre-commit 🪝

1. Install requirements
The requirements for the present workshop are:
```bash
- Git
- Docker 
- Python3	
- jq, curl, make
- bat (optional)
```

2. Setup pre-commit hook
```
- Our pre-commit hook will run a secret detection tool
- The secret detection tool is called Talisman
- Talisman will create a script in .git/hooks and make it executable.
```

Install talisman as a pre-commit hook
```bash
make talisman_setup
```

Your done 👍 move to step 3
```bash
git checkout step3
```

## +info
Git hooks [+](https://githooks.com)    
Talisman [+](https://github.com/thoughtworks/talisman#recommended-approach)   
Secret detection tools[+](https://github.com/arainho/knowledge-base/tree/main/secret-detection)
