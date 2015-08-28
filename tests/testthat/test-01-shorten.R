context("shorten")

test_that("shorten URL [google]", {
  url = shorten.google("http://www.exegetic.biz/blog/2015/08/urlshortener-a-package-for-shortening-urls/")
  expect_equal(url, "http://goo.gl/0Lhu34")
})
