test_that("restore_units.numeric() works", {

  expect_identical(
    restore_units(c(1L, 2L), 3),
    c(1L, 2L))

  from <- set_units(c(1, 2), "ton/yr")
  to <- c(3, 4)

  expect_identical(
    units::deparse_unit(restore_units(to, from)),
    units::deparse_unit(from))

})

test_that("restore_units.data.frame() works", {

  from <- data.frame(
    bar = c(3, 4, 99),
    foo = set_units(c(1L, 2L, 99L), "ton/yr"),
    bap = set_units(c(7, 8, 99), "ug/m^3"),
    wee = set_units(c(1, 1, 1), "km^2"))

  to <- data.frame(
    foo = c(1L, 2L),
    bar = c(3, 4),
    baz = c(5L, 6L),
    bap = c(7, 8))

  expected <- data.frame(
    foo = set_units(c(1L, 2L), "ton/yr"),
    bar = c(3, 4),
    baz = c(5L, 6L),
    bap = set_units(c(7, 8), "ug/m^3"))

  expect_identical(
    restore_units(to, from),
    expected)

})
