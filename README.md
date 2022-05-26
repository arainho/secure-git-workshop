## the end 

### 1. Test the app locally
Read the key to a local environment variable
```bash
read -s API_KEY
``````

Test the app locally
```bash
API_KEY="${API_KEY}" python3 get_wheather.py Aveiro
```

Spin up the app inside a container
```bash
API_KEY="${API_KEY}" make run
```

### You finish the workshop, congrats! 🎉 
