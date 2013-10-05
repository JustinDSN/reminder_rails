# Reminder -- Code for good project

## Workstation setup
* Clone the app.
* Install the ruby version specified by .ruby-version
* Database setup (change YOUR_USERNAME with your username, see that from whoami)
```
cp config/database.yml.example config/database.yml
sed -i '' 's/*YOUR USERNAME*/${whoami}/g' config/database.yml
```
