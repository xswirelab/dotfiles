#!/bin/bash
curl 'https://slack.com/api/users.profile.set' \
--header "Authorization: Bearer $SLACK_TOKEN" \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw "{
   \"profile\": {
        \"status_text\": \"404\",
        \"status_emoji\": \":coffee:\",
        \"status_expiration\": 0
    }
}"

curl 'https://slack.com/api/users.setPresence' \
--header "Authorization: Bearer $SLACK_TOKEN" \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw "{
   \"presence\": \"away\"
}"
