curl -X "POST" "https://api.github.com/repos/gary-h9/gary-blog/issues?state=all" \
     -H "Cookie: logged_in=no" \
     -H "Authorization: token THEd13GITHUBfb87TOKENa4FROM5eSETTINGS" \
     -H "Content-Type: text/plain; charset=utf-8" \
     -d $'{
  "title": "Test123",
  "body": "TEST",
  "milestone": 5,
  "assignees": [
    "Gary-H9"
  ],
  "labels": [
  ]
}'
