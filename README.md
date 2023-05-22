## step1 - gitignore 🐝

### 1. Identify private and public data   👓 vs 🕶️   
```
- Think of your folders and files such as classes and methods in code   
- They can be private or public depending on the type of data on it  
- Sensitive data could be credentials, certificates or Personally Identifiable Information   
- Public data such could be code, comments or general information    
```
   
### 2. Create a gitignore file accordingly  
``` 
- Identify your operating systems, IDE's, programming languages and other tools      
- Use gitignore.io service to generate .gitignore files for your project   
```

### 3. Add a line with config.ini in gitignore
```
- Edit .gitignore file
- write config.ini inside
```

### 4. Add gitignore to the repo
```bash
git add .gitignore
git commit -m "ignore config.ini file"
```

### 5. Collect you key from OpenWeatherMap
```
- https://home.openweathermap.org/api_keys
```

### 6. Create and fill out config.ini file locally
```
$ cp -v samples/config.ini.sample config.ini
```

### 7. Ensure that the private config.ini is ignored
```bash
git status
grep -r --color config.ini .gitignore | grep -v "#"
git check-ignore -v config.ini
```

### Well done 👍 move to step2
```bash
git checkout step2
```
