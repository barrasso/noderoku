# noderoku
A bash script that creates a NodeJS web app project ready to be deployed on Heroku.

## How To Use
Begin by downloading the `noderoku.sh` file, or clone the repository: `git clone https://github.com/barrasso/noderoku`

Make sure your file has the correct permissions to run: `chmod 700 noderoku.sh`

The script takes two parameters:
  - **$APP_NAME** (the name of your app project) 
  - **$DIR_NAME** (the directory that you want to create the project in)
    - *If the directory you provide does not exist, the script will create it.*
    
To run the script, replace the following parameters with your own: `./noderoku $APP_NAME $DIR_NAME`
    
### Example commands

Creates a noderoku project in the `path/to/myapp` directory
```bash
./noderoku MyApp path/to/myapp
```

Create a noderoku project in the script's root directory
```bash
./noderoku MyApp .
```
