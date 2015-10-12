#!/bin/bash
# List open issues for public repositories on all my accounts
set -e

my_username="your_username"
github_api_token=Generate at: https://github.com/settings/tokens

myaccounts="your_username
  account_two
  account_three"

#### No additional customisation required ####
authed_curl="curl -s -u $my_username:$github_api_token"
repositories=()

for account in $myaccounts; do
  url="$authed_curl https://api.github.com/users/${account}/repos"
  repositories="$url | jq '.[] | .full_name'"
  for repo in `$url | jq -r '.[] | .full_name'`; do
    echo "Open issues for $repo:"
    $authed_curl "https://api.github.com/repos/${repo}/issues" | jq -r '.[] | { Name: .title, URL: .html_url, user: .user.login, created: .created_at, updated: .updated_at }'
    # echo "Open pull requests for $repo:"
    # $authed_curl "https://api.github.com/repos/${repo}/pulls" | jq -r '.[] | { URL: .html_url, user: .user.login, created: .created_at, updated: .updated_at }'

  done
done
