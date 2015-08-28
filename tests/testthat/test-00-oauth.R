context("authenticate")

# For this to work you need to have setup the Authorized redirect URIs to include
#
#   http://localhost:1410/
#
# in the Google Developers' Console.
#
test_that("authenticate at goog.gl", {
  key = "863558629146-2ag2qh1j4c976mf5dtm6n98gi85esn2h.apps.googleusercontent.com"
  secret = "BmKO7fNzZWwexWDp3x0sNh_c"
  shortener_authenticate(key, secret)
})
