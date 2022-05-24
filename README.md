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
echo "secret_key=c64e8c79aacf5ddb02f1274db2d973f363f4f553ab1692 ⚡☠️" > insecure_notes.txt
git add insecure_notes.txt
```

Try to commit the file, and talisman will prompt a warning.
```bash
git commit -m "secret note1"

Talisman Report:
+--------------------+------------------------------------------------------+----------+
|  file              | errors                                               | severity |
+--------------------+------------------------------------------------------+----------+
| insecure_notes.txt | Expected file to not to contain                      | high     |
|                    | - hex encoded texts such as:                         |          |
|                    | - secret_key=c64e8c79aacf5ddb02f1274db2d973f363f4... |          |
+--------------------+------------------------------------------------------+----------+
```

### 4. Try adding a another secret
Add a secret to a file
```bash
echo "# new secret \nAKIAIOSFODNN7EXAMPLE ⚡☠️" >> insecure_notes.txt
git add insecure_notes.txt
```

Try to commit the file, talisman will continue 🔥
```bash
git commit -m "secret note2"
```

### 5. Let's see with another tool 🧐
```bash
make audit_trufflehog
```

Now trufflehog finds the new hardcoded secret 😂
```json
{"branch": "FETCH_HEAD", "commit": "my insecure note\n", "commitHash": "990563066936dc2cbdcf19ea4736da4016473436", "date": "2022-05-24 00:32:30", "diff": "@@ -1,2 +0,0 @@\n-# add secrets! \u26a1\u26a1\u26a1\u2620\ufe0f\u2620\ufe0f\u2620\ufe0f \n-AKIAIOSFODNN7EXAMPLE\n", "path": "insecure_notes.txt", "printDiff": "\u001b[93mAKIAIOSFODNN7EXAMPLE\u001b[0m", "reason": "AWS API Key", "stringsFound": ["AKIAIOSFODNN7EXAMPLE"]}
```

That's why it's important to have more than one secret detection tool in place!

### Your done 👍 move to step 3
```bash
git checkout step3
```

#### +info
Git hooks [+](https://githooks.com)    
Talisman [+](https://github.com/thoughtworks/talisman#recommended-approach)   
Secret detection tools[+](https://github.com/arainho/knowledge-base/tree/main/secret-detection)
