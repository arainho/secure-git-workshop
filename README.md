## step2 - pre-commit 🪝

### 1. Setup pre-commit hook
```
- Our pre-commit hook will run a secret detection tool
- The secret detection tool is called Talisman
- Talisman will create a script in .git/hooks and make it executable.
```

### 2. Install talisman as a pre-commit hook
```bash
make talisman_setup
```

### 3. Check talisman in action
Add a secret to a file
```bash
echo "# super secret! ⚡⚡⚡☠️☠️☠️ \nawsSecretKey=c64e8c79aacf5ddb02f1274db2d973f363f4f553ab1692" > insecure_notes.txt
git add insecure_notes.txt
```

Try to commit the file, and talisman will prompt a warning.
```bash
git commit -m "aws key"                        
```

```bash
Talisman Report:
+--------------------+-------------------------------------------------------------------------------+----------+
|        FILE        |                                    ERRORS                                     | SEVERITY |
+--------------------+-------------------------------------------------------------------------------+----------+
| insecure_notes.txt | Expected file to not to contain                                               | high     |
|                    | hex encoded texts such as:                                                    |          |
|                    | awsSecretKey=c64e8c79aacf5ddb02f1274db2d973f363...                            |          |
+--------------------+-------------------------------------------------------------------------------+----------+
```

##
### Your done 👍 move to step 3
```bash
git checkout step3
```

#### +info
Git hooks [+](https://githooks.com)    
Talisman [+](https://github.com/thoughtworks/talisman#recommended-approach)   
Secret detection tools[+](https://github.com/arainho/knowledge-base/tree/main/secret-detection)
