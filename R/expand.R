# See the "logurl" package.

# TINYURL -------------------------------------------------------------------------------------------------------------

library(RCurl)

decode.short.url <- function(u) {
  x <- try( getURL(u, header = TRUE, nobody = TRUE, followlocation = FALSE) )
  if(class(x) == 'try-error') {
    return(u)
  } else {
    x <- strsplit(x, "Location: ")[[1]][2]
    return(strsplit(x, "\r")[[1]][1])
  }
}


( u <- c("http://tinyurl.com/adcd", "http://tinyurl.com/fnqsh") )
( sapply(u, decode.short.url) )
