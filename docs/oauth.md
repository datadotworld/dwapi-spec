data.world supports the OAuth 2.0 protocol for authentication and authorization. If you are new to OAuth 2.0, the [OAuth Bible](http://oauthbible.com/) is a good place to start and learn some of the theory. Presently, data.world only supports the Authorization Code Grant flow (a.k.a. 3-legged OAuth).

To request client keys email <help@data.world> including the name of your app, a URL for 75x75 logo for your app, the `redirect_uri` you intend to use. 

# Auth Steps

All applications follow a basic pattern when accessing a data.world API using OAuth 2.0.

1. Application redirects user to `https://data.world/oauth/authorize` for authorization, providing the following parameters:  
  `client_id`  
  `redirect_uri`  
  `response_type = "code"`  
  `state`

    **Example Authorization URL:**  
    ```
    https://data.world/oauth/authorize?
      client_id=3MVG9lKcPoNINVB&
      redirect_uri=http://localhost/oauth/code_callback&
      response_type=code
    ```

2. User logs into data.world and grants application access.  

3. data.world redirects user back to the `redirect_uri` with:  
  `code`  
  `state`

4. Application takes the `code` and exchanges it for an access token:  
  `client_id`  
  `client_secret`  
  `code`  
  `redirect_uri` *Optional*  
  `grant_type = "authorization_code"`  

    **Example Token Request:**
    ```
    POST
    https://data.world/oauth/access_token?
      code=zac4ZV2XbleQ2e&
      client_id=3MVG9lKcPoNINVB&
      client_secret=3iQF9BsWEr6nCf&
      grant_type=authorization_code
    ```

5. If `client_id` and `client_secret` are valid data.world will respond with:  
  `access_token`  
  `expires_in`  
  `refresh_token`  
  Alternatively, if a `redirect_uri` was provided, `data.world` will invoke it passing the same list of attributes.

6. Application stores `access_token` to use in subsequent requests by placing it into the request as an `Authorization: Bearer [access_token]` header string.

This flow requires that your application run on a web server, so that step #3 and #4 can be performed while your `client_secret` remains protected behind a server environment.

**DO NOT** include your `client_secret` in source code that accessible to others or client-side apps as they can easily be reverse engineered. See the following section for additional instructions.

# Reference implementation

Check out our reference implementation on [GitHub](https://github.com/datadotworld/connector-oauth).   
This example, written in Node.js can be deployed to your Heroku account as-is with click of a button. Super easy!  
Look for the **Deploy to Heroku** button at the bottom of the README.md.

## Client-side apps

Static sites and installed apps can safely integrate OAuth 2.0 if paired with a simple web app built and deployed exclusively to supports steps #3 and #4.  
That can be accomplished easily using the same reference implementation referenced above.