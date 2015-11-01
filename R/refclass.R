# http://adv-r.had.co.nz/R5.html

# Basic outline for reference class implementation.

urlShortener <- setRefClass("urlShortener",
                            fields = list( key = "character",
                                           secret = "character"),
                            methods = list(
                              shorten = function(url) {
                                # invisible(value)
                              },
                              expand = function() {
                                # invisible(prev)
                              }
                            ))

googleShortener <- setRefClass("googleShortener",
                               contains = "urlShortener"
)

bitlyShortener <- setRefClass("bitlyShortener",
                              contains = "urlShortener"
)
