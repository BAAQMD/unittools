test_that("has_units() works", {

  x <- set_units(1:3, "ton/d")

  expect_true(has_units(x))
  expect_true(has_units(x, "ton/day"))
  expect_false(has_units(x, "g/s"))

  expect_false(has_units(1:3))

  expect_true(has_units(x / x))
  expect_true(has_units(x / x, ""))

})
