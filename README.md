# Slack Desk Swap Bot [![CircleCI](https://circleci.com/gh/artsy/slack-desk-swap.svg?style=svg)](https://circleci.com/gh/artsy/slack-desk-swap)

### What's this?

- opt in/out per organization
- on question day (default monday) (per org) we ask each person when they want to swap for this week
  - it will show them list of days
- We do match based on responses from above
- Location NY/Berlin/London maybe  timezone
- Stats: we can ask about each person and total stats

### Run

```
bundle install
rake db:create db:migrate
rackup
```

### Opening a console
```
./script/console
```
