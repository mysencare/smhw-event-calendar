## Setup for Mac

```bash
brew install postgresql
brew services start postgresql
createuser --superuser event_calendar

bundle install

bin/rake db:create
```
