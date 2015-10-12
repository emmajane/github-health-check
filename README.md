GitHub Health Check
-------------------

Tools I can use to check up on the various accounts / organisations I have on GitHub.

- `check-repos.sh` -- look for open issues across all of my repositories for all of my accounts

Check the notes for additional setup requirements. To run the script(s), navigate to the folder where the script is stored, and then use:

````
$ sh ./[filename]
````

Alternately, you can put the script into a recognised folder for your scripts, such as `/usr/local/bin`.

## Notes

The health checks use the GitHub API, which spits out JSON. To make things legible (and to remove the excess information), the output is filtered using [jq](https://stedolan.github.io/jq/). I installed this app via [brew](http://brew.sh/) because I am exceptionally lazy (`brew install jq`).

The GitHub API will limit the number of requests you can make per hour to (approximately) 60 requests. If you want to increase the rate limiting to (approximately) 5000 requests/hour you will need an personal access token. You can generate this token at https://github.com/settings/tokens.
