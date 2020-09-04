# x <- population("us")
#
# test_that("population() returns a data frame", {
#   expect_s3_class(x, "data.frame")
# })

test_that("population() returns the right columns", {
  x <- population("us")
  expect_equal(names(x), c("region", "fips", "year", "pop" ))
})

test_that("population() returns the right types", {
  x <- population("us")

  expect_type(x$region, "character")
  expect_type(x$fips, "character")
  expect_type(x$year, "integer")
  expect_type(x$pop, "double")
})

test_that("population() works for US, states, and counties", {
  x <- population("us")
  expect_true(unique(x$region) == "United States")
  # make population("state:*") work
  # also get rid of message from as_tibble
})

test_that("population() throws an error for unallowed `geography` values", {
  expect_error(population("tract"))
})
