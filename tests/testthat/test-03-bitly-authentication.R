context("Bitly Authentication")

credentials = fromJSON("../../account-credentials.json", simplify = FALSE)

test_that("OAuth is successful (Bitly)", {
  shortener_authenticate(credentials$bitly$key, credentials$bitly$secret)
  expect_true(exists("oauth_token", oauth_cache))
})
