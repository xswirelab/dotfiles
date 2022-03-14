#!/bin/bash
curl 'https://slack.com/api/users.setPresence' \
--header "Authorization: Bearer $SLACK_TOKEN" \
--header 'Content-Type: application/json; charset=utf-8' \
--data-raw "{
   \"presence\": \"away\"
}"
