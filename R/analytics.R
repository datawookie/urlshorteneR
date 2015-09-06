# GOOGLE --------------------------------------------------------------------------------------------------------------

analytics.google <- function(url, analytics = c("FULL", "ANALYTICS_CLICKS", "ANALYTICS_TOP_STRINGS")) {
  token = get("oauth_token", envir = oauth_cache)

  result = httr::GET("https://www.googleapis.com/urlshortener/v1/url",
                     query = list(access_token = token$credentials$access_token,
                                  shortUrl = url,
                                  projection = analytics[1]))

  stop_for_status(result)

  matrix(as.integer(unlist(httr::content(result)$analytics)), nrow = 5, byrow = TRUE,
         dimnames = list(c("allTime", "month", "week", "day", "twoHours"), c("shortUrlClicks", "longUrlClicks")))
}

# BITLY ---------------------------------------------------------------------------------------------------------------

# There is a lot more analytics functionality, like country of click, available at
# http://dev.bitly.com/link_metrics.html.
#
analytics.bitly <- function(url) {
  token = get("oauth_token", envir = oauth_cache)

  result = httr::GET("https://api-ssl.bitly.com/v3/link/clicks",
                     query = list(access_token = token$credentials$access_token,
                                  units = -1,
                                  link = url))

  stop_for_status(result)

  httr::content(result)$data
}
