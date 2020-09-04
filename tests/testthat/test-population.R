
test_that("population() returns a data frame", {
  x <- population("us")

  expect_s3_class(x, "data.frame")
})

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

test_that("population() returns the correct FIPS", {
  us <- population("us")
  county <- population("county")
  state <- population("state")

  expect_true(all(us$fips == "0L"))
  expect_true(all(stringr::str_length(state$fips) == 2))
  expect_true(all(stringr::str_length(county$fips) == 5))
})

test_that("population() throws an error for unallowed `geography` values", {
  expect_error(population("tract"))
})
