library(urlshorteneR)
library(RJSONIO)

credentials = fromJSON("account-credentials.json", simplify = FALSE)

# GOOGLE --------------------------------------------------------------------------------------------------------------

shortener_authenticate(credentials$google$key, credentials$google$secret)

shorten.google("http://www.google.com")
expand.google("http://goo.gl/3WwfIY")
analytics.google("http://goo.gl/3WwfIY")

# BITLY ---------------------------------------------------------------------------------------------------------------

shortener_authenticate(credentials$bitly$key, credentials$bitly$secret, "bitly")

shorten.bitly("http://www.google.com")
expand.bitly("http://bit.ly/1Qho4Y5")
analytics.bitly("http://bit.ly/1Qho4Y5")

# LONGURL -------------------------------------------------------------------------------------------------------------

library(longurl)

expand_urls(c("http://goo.gl/3WwfIY", "http://bit.ly/1Qho4Y5"), warn = FALSE)
