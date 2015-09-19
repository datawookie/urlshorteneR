context("Google")

#
# analytics.google("http://goo.gl/3WwfIY")

test_that("URL shortener (Google)", {
  url = shorten.google("http://www.google.com")
  expect_true(grepl("http://goo.gl/", url))
})

test_that("URL expander (Google)", {
  url = expand.google("http://goo.gl/3WwfIY")
  expect_equal(url, "http://www.google.com/")
})
