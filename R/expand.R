# See the "logurl" package.

# GOOGLE --------------------------------------------------------------------------------------------------------------

expand.google <- function(url) {
  token = get("oauth_token", envir = oauth_cache)

  result = httr::GET("https://www.googleapis.com/urlshortener/v1/url",
                     query = list(access_token = token$credentials$access_token, shortUrl = url))

  httr::stop_for_status(result)

  httr::content(result)$longUrl
}

# BITLY ---------------------------------------------------------------------------------------------------------------

expand.bitly <- function(url) {
  token = get("oauth_token", envir = oauth_cache)


  result = httr::GET("https://api-ssl.bit.ly/v3/expand",
                     query = list(access_token = token$credentials$access_token, shortUrl = url))

  httr::stop_for_status(result)

  # This is a list of expanded URLs, so in principle we could expand multiple (up to 15?) URLs with a single call.
  httr::content(result)$data$expand[[1]]$long_url
}

# TINYURL -------------------------------------------------------------------------------------------------------------

# library(RCurl)

# decode.short.url <- function(u) {
#   x <- try( getURL(u, header = TRUE, nobody = TRUE, followlocation = FALSE) )
#   if(class(x) == 'try-error') {
#     return(u)
#   } else {
#     x <- strsplit(x, "Location: ")[[1]][2]
#     return(strsplit(x, "\r")[[1]][1])
#   }
# }
#
#
# ( u <- c("http://tinyurl.com/adcd", "http://tinyurl.com/fnqsh") )
# ( sapply(u, decode.short.url) )
