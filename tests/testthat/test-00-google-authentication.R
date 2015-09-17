context("Google Authentication")

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

test_that("OAuth is successful (Google)", {
  key = "863558629146-2ag2qh1j4c976mf5dtm6n98gi85esn2h.apps.googleusercontent.com"
  secret = "BmKO7fNzZWwexWDp3x0sNh_c"
  shortener_authenticate(key, secret)
  expect_equal(TRUE, TRUE)
})
