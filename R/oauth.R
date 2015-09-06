# Redirect URI: Set this to http://localhost:1410.
#
#   Google [https://console.developers.google.com/project/_/apiui/credential]
#   bitly  [https://bitly.com/a/oauth_apps]
#
# To retrieve cached tokens use
#
# > readRDS('.httr-oauth')
#
shortener_authenticate = function(key, secret, method = "google") {
  if (method == "google") {
    oauth_token <- httr::oauth2.0_token(httr::oauth_endpoints("google"),
                                        httr::oauth_app("google", key = key, secret = secret),
                                        scope = "https://www.googleapis.com/auth/urlshortener",
                                        # use_oob = TRUE,
                                        cache = TRUE)
  } else if (method == "bitly") {
    oauth_token <- httr::oauth2.0_token(oauth_endpoint(authorize = "https://bitly.com/oauth/authorize",
                                                       access = "https://api-ssl.bitly.com/oauth/access_token"),
                                        httr::oauth_app("bitly", key = key, secret = secret),
                                        # scope = "https://www.googleapis.com/auth/urlshortener",
                                        # use_oob = TRUE,
                                        cache = TRUE)
  } else {
    stop("Method '", method, "' not yet implemented!")
  }

  assign("oauth_token", oauth_token, envir = oauth_cache)
  assign("method",      method,      envir = oauth_cache)
}

# key = "863558629146-2ag2qh1j4c976mf5dtm6n98gi85esn2h.apps.googleusercontent.com"
# secret = "BmKO7fNzZWwexWDp3x0sNh_c"
# shortener_authenticate(key, secret)

# BITLY
#
# key = "692987373e98479f9faca10e7c2ea15d6c56fd82"
# secret = "943c5fe36d8596fbb73421090260ebe0d7cbc1a9"
shortener_authenticate(key, secret, "bitly")

# 1. Find OAuth settings for bit.ly:
# http://dev.bitly.com/authentication.html
# bitly <- oauth_endpoint(
#   authorize = "https://bitly.com/oauth/authorize",
#   access = "https://api-ssl.bitly.com/oauth/access_token")

# 2. Register an application at http://dev.bitly.com/my_apps.html
# Insert your values below - if secret is omitted, it will look it up in
# the BITLY_CONSUMER_SECRET environmental variable.
# myapp <- oauth_app("bitly",
#                    key = clientID, # Client ID
#                    secret = clientSecret) # Client Secret
#
# bitly_token <- oauth2.0_token(bitly, myapp, cache = FALSE)
