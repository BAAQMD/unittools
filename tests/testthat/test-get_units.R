test_that("get_units()", {
  x <- set_units(1, "g")
  expect_equal(get_units(x), "g")
  expect_null(get_units(1))
})
