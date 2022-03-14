#!/bin/bash
curl 'https://slack.com/api/users.profile.set' \
--header "Authorization: Bearer $SLACK_TOKEN" \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw "{
   \"profile\": {
        \"status_text\": \"200 OK\",
        \"status_emoji\": \":face_with_cowboy_hat:\",
        \"status_expiration\": 0
    }
}"

curl 'https://slack.com/api/users.setPresence' \
--header "Authorization: Bearer $SLACK_TOKEN" \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw "{
   \"presence\": \"auto\"
}"
