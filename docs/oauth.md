data.world supports the OAuth 2.0 protocol for authentication and authorization. If you are new to
OAuth 2.0, the [OAuth Bible](http://oauthbible.com/) is a good place to start and learn some of the
theory.

Below is an example of what the user experience might look like in your product:

!["OAuth permissions"](https://cdn.filepicker.io/api/file/mENafdaJRPKrdZo8p93y "Permissions")

## Auth Steps

All applications follow a basic pattern when accessing a data.world API using OAuth 2.0.  
The flow can be slightly different, depending on whether the application web-based or native (desktop & mobile).

### Web applications

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

**DO NOT** include your `client_secret` for your *web app* in source code that accessible to others. Use the native applications flow (see below), if you cannot guarantee the confidentiality of your `client_secret`.

### Native applications (desktop, mobile, static sites, other)

data.world supports the [Proof Key for Code Exchange protocol](https://tools.ietf.org/html/rfc7636) to make the native application flow more secure.
A unique code verifier is created for every authorization request, and its transformed value, called `code_challenge`, is sent to the authorization server to obtain the authorization code.

**Create the code verifier**

A code_verifier is a high-entropy cryptographic random string using the unreserved characters `[A-Z] / [a-z] / [0-9] / "-" / "." / "_" / "~"`, with a minimum length of 43 characters and a maximum length of 128 characters.  
The code verifier should have enough entropy to make it impractical to guess the value.

**Create the code challenge**

Two methods of creating the code challenge are supported.

- `plain`: The code challenge is the same value as the code verifier generated above (`code_challenge = code_verifier`).
- `S256`: The code challenge is the Base64URL (with no padding) encoded SHA256 hash of the code verifier (`code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier)))`).

Once the values for `code_verifier`, `code_challenge` and `code_challenge_method` are defined, the flow proceeds, as follows:

1. Application redirects user to `https://data.world/oauth/authorize` for authorization, providing the following parameters:  
  `client_id`  
  `redirect_uri`  
  `response_type = "code"`  
  `state`  
  `code_challenge_method = "S256" or "plain"`  
  `code_challenge`

    **Example Authorization URL:**  
    ```
    https://data.world/oauth/authorize?
      client_id=3MVG9lKcPoNINVB&
      redirect_uri=http://localhost/oauth/code_callback&
      response_type=code&
      code_challenge_method=plain&
      code_challenge=kBPZPENCUAfHyZRoGicqwhuzDawVgtpLsUpfJEvQgGbg6iEHqiteoDjrtgaErwEJ
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
  `code_verifier`

    **Example Token Request:**
    ```
    POST
    https://data.world/oauth/access_token?
      code=zac4ZV2XbleQ2e&
      client_id=3MVG9lKcPoNINVB&
      client_secret=3iQF9BsWEr6nCf&
      grant_type=authorization_code&
      code_verifier=kBPZPENCUAfHyZRoGicqwhuzDawVgtpLsUpfJEvQgGbg6iEHqiteoDjrtgaErwEJ
    ```

5. If `client_id` and `client_secret` are valid data.world will respond with:  
  `access_token`  
  `expires_in`  
  `refresh_token`  
  Alternatively, if a `redirect_uri` was provided, `data.world` will invoke it passing the same list of attributes.

6. Application stores `access_token` to use in subsequent requests by placing it into the request as an `Authorization: Bearer [access_token]` header string.

## Reference implementation

Check out our reference implementation on [GitHub](https://github.com/datadotworld/connector-oauth).   
This example, written in Node.js can be deployed to your Heroku account as-is with click of a button. Super easy!  
Look for the **Deploy to Heroku** button at the bottom of the README.md.

## Ready to get started?

To request client keys [submit a request](https://help.data.world/hc/en-us/requests/new?ticketType=oAuth) including:
 - App/Integration info
   - Name
   - Default permissions (one or more of: read, write, admin)
   - Type (web or native)
   - OAuth redirect URI
 - Developer info:
   - data.world user name
   - website
   - logo or avatar

We'll evaluate your request and usually respond within one business day.
While you wait, you can start programming against our APIs using your personal API token which can be obtained at <https://data.world/settings/advanced>
