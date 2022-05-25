## start point 💡

Open your terminal/console and run the commands below.

### 1. Clone the repository
```bash
git clone https://github.com/arainho/secure-git-workshop.git
cd secure-git-workshop || exit
```

### 2. Move to the 'start' branch
```bash
git checkout start
```

### 3. Verify the required tools
If the verification fails the `setup` target will try to install the tools.
```bash
make verify || make setup
```


### 3. Define metadata for commits  
If it's a university project, use your student email.    
It's a work project, use your company email.    
```bash
git config user.name "Your Name"
git config user.email "your@mail.com"
```

### Done 👍 move to step 1
```bash
git checkout step1
```
