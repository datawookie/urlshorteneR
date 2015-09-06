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
    oauth_token <- httr::oauth2.0_token(httr::oauth_endpoint(authorize = "https://bitly.com/oauth/authorize",
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
