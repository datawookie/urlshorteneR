shorten <- function(url) {
  method = get("method", envir=oauth_cache)
  #
  if (method == "goo.gl") {
    return shorten.google(url)
  }
}

# GOOGLE --------------------------------------------------------------------------------------------------------------

shorten.google <- function(url) {
  URL   = get("url", envir=oauth_cache)
  token = get("oauth_token", envir=oauth_cache)

  result = POST(URL, config = config(token = get("oauth_token", envir=oauth_cache)),
                body = list(longUrl = url),
                encode = "json")

  # TODO: check that result$status_code is 200 and, if not, generate suitable error.

  content(result)$id
}

# POST('https://www.googleapis.com/urlshortener/v1/url?fields=id',
#             add_headers("Content-Type"="application/json"),
#             body='{"longUrl": "http://www.google.com"}', config(token = google_token))

# BITLY ---------------------------------------------------------------------------------------------------------------

require(jsonlite)
require(httr)

# Generate keys here: https://bitly.com/a/sign_in?rd=%2Fa%2Foauth_apps

clientID = "692987373e98479f9faca10e7c2ea15d6c56fd82"
clientSecret = "943c5fe36d8596fbb73421090260ebe0d7cbc1a9"

# 1. Find OAuth settings for bit.ly:
# http://dev.bitly.com/authentication.html
bitly <- oauth_endpoint(
  authorize = "https://bitly.com/oauth/authorize",
  access = "https://api-ssl.bitly.com/oauth/access_token")

# 2. Register an application at http://dev.bitly.com/my_apps.html
# Insert your values below - if secret is omitted, it will look it up in
# the BITLY_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("bitly",
                   key = clientID, # Client ID
                   secret = clientSecret) # Client Secret

bitly_token <- oauth2.0_token(bitly, myapp, cache = FALSE)

# 4. Use API
req <- GET("https://api-ssl.bit.ly/v3/user/info", query = list(access_token = bitly_token$credentials$access_token))
stop_for_status(req)
content(req)$data$profile_url
# [1] "http://bitly.com/u/lukeanker"
