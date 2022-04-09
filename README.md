# secure-git-workshop

## step1

1. Identify private and public data   👓 vs 🕶️   
```
- Think of your folders and files such as classes and methods in code   
- They can be private or public depending on the type of data on it  
- Sensitive data could be credentials, certificates or Personally Identifiable Information   
- Public data such could be code, comments or general information    
```
   
2. Create a gitignore file accordingly  
``` 
- Identify your operating systems, IDE's, programming languages and other tools      
- Use gitignore.io serivce to generate .gitignore files for your project   
```

3. Observe the example file config.ini.sample
```
Open and observe the dummy data showing how to fill out private data.  
```

4. Add an entry for private config
```
Write an entry in .gitignore file for config.ini
```

5. Ensure that the private config is ignored
```
git check-ignore -v *
```

6. Fill out the config.ini file locally
```
- Signup the Wheather API or OpenWeatherMap service
- Create an API key
- Fill out config.ini with the correspondent data
```


## Well done 👍 move to step 2
```bash
git checkout step2
```

## +info
Generate git ignore files [gitignore.io](https://www.toptal.com/developers/gitignore)     
WheatherAPI [signup](https://www.weatherapi.com/signup.aspx ), [keys](https://www.weatherapi.com/my/)    
OpenWheatherMap [signup](https://home.openweathermap.org/users/sign_up), [api-keys](https://home.openweathermap.org/api_keys)    
Python json (de)serializations [examples](https://realpython.com/python-json/#a-simple-deserialization-example)      

