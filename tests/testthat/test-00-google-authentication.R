context("Google Authentication")

library(RJSONIO)

HTTROAUTH = ".httr-oauth"
HTTROAUTHPATH = "../.."

# Can't do actual authentication in a test because that requires interactive mode. So, instead, we link in the cached
# authentication data (presuming that it's there!).
#
test_that("Linking in .httr_auth", {
  if (!file.exists(HTTROAUTH)) {
    file.symlink(file.path(HTTROAUTHPATH, HTTROAUTH), ".")
  }
  expect_true(file.exists(HTTROAUTH))
})

credentials = fromJSON("../../account-credentials.json", simplify = FALSE)

test_that("OAuth is successful (Google)", {
  shortener_authenticate(credentials$google$key, credentials$google$secret)
  expect_equal(TRUE, TRUE)
})
