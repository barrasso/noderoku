#!/bin/bash

APP_NAME="$1"
DIR_NAME="$2"

if [[ -z $1 ]] ; then
    echo 'Invalid app name: $APP_NAME.'
    exit 1
fi

if [[ -z $2 ]] ; then
    echo 'Invalid directory name: $DIR_NAME.'
    exit 1
fi

# init project
mkdir -p "$DIR_NAME" && cd "$DIR_NAME"

mkdir back
mkdir front
mkdir front/js
mkdir front/css
mkdir front/img
mkdir front/docs
mkdir front/views
mkdir front/js/scripts
mkdir front/js/services
mkdir front/js/directives
mkdir front/js/controllers

# init root files
touch .env
touch app.js
touch Procfile
touch package.json

# set Procfile contents for app 
echo 'web: node app.js' >> Procfile

# create readme doc
touch README.md
echo '# $APP_NAME' >> README.md
echo '### Noderoku app' >> README.md

# init other app files
touch back/app.js
touch back/routes.js
touch front/index.html
touch front/views/404.html
echo "<h1>$APP_NAME is running!</h1>" >> front/index.html
echo "<h1>404 PAGE NOT FOUND</h1>" >> front/views/404.html

# require back end
echo "require('./back/app.js');" >> app.js

# init package.json
echo '
{
	"name": "'$APP_NAME'",
	"main": "app.js",
	"version": "0.0.1",
	"description": "",
	"repository": "",
	"author": "",
	"license": "MIT",
	"dependencies": {
		"express": "^4.13.3"
	},
	"engines": {
		"node": "v6.4.0"
	}
}' >> package.json

# init back/app.js
echo "
/* include required app modules */
var express = require('express');

/* app setup */
var app = express();
app.use(express.static(__dirname + '/../front')); 
require('./routes')(app); 

/* app startup */
var port = process.env.PORT || 5000;
app.listen(port);                                  
console.log('$APP_NAME is listening on port ' + port);
exports = module.exports = app;" >> back/app.js

# init back/routes.js
echo "module.exports = function(app) {
    app.get('/', function(req, res) {
        res.sendFile('index.html', {
            'root': './front', 
        });
    });
};" >> back/routes.js

# ignore files from source control
echo "node_modules" >> .gitignore
echo "DS_Store" >> .gitignore
echo ".env" >> .gitignore

# Next, npm install and heroku apps:create your-app-names