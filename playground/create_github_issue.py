import os
import json
import requests

# The repository to add this issue to
REPO_OWNER = 'xxxxx'
REPO_NAME = 'xxxxx'

headers = {'Authorization': "token xxxx"}

def make_github_issue(title, body=None):
    '''Create an issue on github.com using the given parameters.'''
    # Our url to create issues via POST
    url = 'https://api.github.com/repos/%s/%s/issues' % (REPO_OWNER, REPO_NAME)

    # Create our issue
    issue = {'title': title,
             'body': body,
            }
    # Add the issue to our repository
    r = requests.post(url, json.dumps(issue), headers=headers)
    if r.status_code == 201:
        print ('Successfully created Issue {0:s}'.format(title))
    else:
        print ('Could not create Issue {0:s}'.format(title))
        print ('Response:', r.content)

make_github_issue('123','123')
