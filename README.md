# VersionEye Update

[VersionEye](https://www.versioneye.com) can monitor your project on GitHub/Bitbucket and notify you about out-dated dependencies and license violations. The integration via the GitHub/Bitbucket API works very well and is very convenient. 

However. Not everybody is using GitHub/Bitbucket. Through the [VersionEye API](https://www.versioneye.com/api/) you can create/update projects as well and take advantage of the VersionEye infrastructure. Assume you created already a project through file upload or via the URL feature. Now you want to update the project every day automatically with your current project file to get the notifications. That's the mission of this project. 

## Configuraiton 

Open the `update.sh` script and replace `<YOUR_SECRET_API_KEY>` in line 4 with your actual API KEY. You can get it from [here](https://www.versioneye.com/settings/api). Replace `<YOUR_PROJECT_ID>` in line 5 with the project ID from your VersionEye project. If you are using VersionEye Enterprise please adjust the `VERSIONEYE_SERVER` path in line 3 as well. 

```
#!/bin/bash 

VERSIONEYE_SERVER=https://www.versioneye.com
API_KEY=<YOUR_SECRET_API_KEY> 
PROJECT_ID=<YOUR_PROJECT_ID>
```

## Usage

The `update.sh` script is a very simple shell script which is updating an existing project at VersionEye with a current project file via CURL. Simply run this command

```
./update.sh <PROJECT_FILE>
```

to update an existing project at VersionEye with a project file. For example: 

```
./update.sh composer.lock
```

VersionEye will parse the uploaded project file and return a JSON object. The script will out put the number of dependencies, the number of out-dated dependencies and the number of license violations if you have a license whitelist on the server. The result looks like that: 

![VersionEye Dependencies](images/update-sh.png)
