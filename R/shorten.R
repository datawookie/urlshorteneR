# GOOGLE --------------------------------------------------------------------------------------------------------------

shorten.google <- function(url) {
  token = get("oauth_token", envir = oauth_cache)

  result = httr::POST("https://www.googleapis.com/urlshortener/v1/url",
                config = httr::config(token = token),
                body = list(longUrl = url),
                encode = "json")

  stop_for_status(result)

  httr::content(result)$id
}

# BITLY ---------------------------------------------------------------------------------------------------------------

shorten.bitly <- function(url) {
  token = get("oauth_token", envir = oauth_cache)

  result = httr::GET("https://api-ssl.bit.ly/v3/shorten",
               query = list(access_token = token$credentials$access_token, longUrl = url))

  stop_for_status(result)

  httr::content(result)$data$url
}

# DISPATCHER ----------------------------------------------------------------------------------------------------------

# shorten <- function(url) {
#   method = get("method", envir=oauth_cache)
#   #
#   if (method == "google") {
#     return(shorten.google(url))
#   }
# }
