#Authentication
In order to handle token expiration and invalidation we
listen to all outgoing requests with their responses and handle the case of 
getting a status code of 401 (unauthorized). If it's the case then I'll
have to try to refresh the access token If it fails to do so, then We'll
have to log the user out.

###The process should look like this:
- Listen to the request by overriding the send method on the http client
- Handle the unauthorized request by refreshing the token
- If the refresh fails then log the user out

**I might also need to retry requests a few times in case they fail
with a different status code**
