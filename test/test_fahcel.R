# Run from repository root: Rscript --vanilla test/test_fahcel.R
before <- getwd()
source("test/FahCel.R")
stopifnot(identical(before, getwd()))
stopifnot(isTRUE(all.equal(fahrenheit_to_celsius(c(32, 212, -40)), c(0, 100, -40))))
for (bad in list("32", NA_real_, Inf, numeric(0))) {
  stopifnot(inherits(try(fahrenheit_to_celsius(bad), silent = TRUE), "try-error"))
}
cat("Fahrenheit conversion, invalid inputs and source side-effect checks passed.\n")
