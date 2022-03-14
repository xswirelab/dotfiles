#!/bin/bash
source $DOTFILES/secrets.zsh

curl 'https://slack.com/api/users.profile.set' \
--header "Authorization: Bearer $SLACK_TOKEN" \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw "{
   \"profile\": {
        \"status_text\": \"404\",
        \"status_emoji\": \":spiral_calendar_pad:\",
        \"status_expiration\": 0
    }
}"
