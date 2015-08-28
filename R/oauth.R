shortener_authenticate = function(key, secret, method = "goo.gl") {
  if (method == "goo.gl") {
    oauth_token <- oauth2.0_token(oauth_endpoints("google"),
                                  oauth_app("google", key = key, secret = secret),
                                  scope = "https://www.googleapis.com/auth/urlshortener")
    url <- "https://www.googleapis.com/urlshortener/v1/url"
  } else {
    stop("Method '", method, "' not yet implemented!")
  }

  assign("oauth_token", oauth_token, envir = oauth_cache)
  assign("url",         url,         envir = oauth_cache)
  assign("method",      method,      envir = oauth_cache)
}
