# How to generate your OpenStack token
This example assumes you are using Linux/MacOS
## First time
1. Create a file called `body.json`
1. Add the following JSON code to the file
```
{
    "auth": {
        "identity": {
            "methods": [
                "password"
            ],
            "password": {
                "user": {
                    "name": "YOUR UNIVERSITY ID HERE",
                    "domain": {
                        "name": "cs.cf.ac.uk"
                    },
                    "password": "YOUR UNIVERSITY PASSWORD HERE"
                }
            }
        }
    }
}
```
1. Replace the YOUR UNIVERSITY ID HERE and YOUR UNIVERSITY PASSWORD HERE text with your id and password.
 - !!!!WARNING!!!! After you have generated the token you MUST remove your password from the file. !!!!WARNING!!!!
1. Run the following curl command in your terminal.  
`curl --data @body.json --header "Content-Type: application/json" --dump-header output.txt https://cscloud.cf.ac.uk:5000/v3/auth/tokens`
1. IMPORTANT! Remove your password from the body.json file now. You no longer need it
1. You should now have a file called output.txt, the contents of which should look something like this.
```
HTTP/1.1 201 Created
Server: nginx/1.10.3 (Ubuntu)
Date: Tue, 12 Mar 2019 14:56:41 GMT
Content-Type: application/json
Content-Length: 376
X-Subject-Token: [[This is where your token will be]]
Vary: X-Auth-Token
x-openstack-request-id: req-8e857-668-41d-969-178dd34
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
Content-Security-Policy: default-src 'self' https: wss:;
X-Frame-Options: DENY
```
1. You should now export the token to your environment like so `export TF_VAR_token=PASTE_YOUR_TOKEN_HERE`  
 - The token is only in the environment for the terminal that you exported in in.
 - If you close the terminal you will need to re-export the token to a new terminal.
 - You token is valid for 12 hours. After that you will need to generate a new one


## Further token generation
1. Skip steps 1 and 2
1. Continue from step 3


## Personal computers
If you are using your own machine, you may want to use Postman instead of curl.
[Postman homepage](www.getpostman.com)
