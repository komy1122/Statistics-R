# Fahrenheit to Celsius. Safe to source from the project root.
fahrenheit_to_celsius <- function(fahrenheit) {
  if (!is.numeric(fahrenheit) || length(fahrenheit) == 0L ||
      anyNA(fahrenheit) || any(!is.finite(fahrenheit))) {
    stop("fahrenheit must contain finite numeric values")
  }
  (fahrenheit - 32) / 1.8
}

if (sys.nframe() == 0L) {
  args <- commandArgs(trailingOnly = TRUE)
  if (length(args) > 0L) {
    value <- suppressWarnings(as.numeric(args))
    print(fahrenheit_to_celsius(value))
  } else if (interactive()) {
    value <- suppressWarnings(as.numeric(readline("Fahrenheit? ")))
    print(fahrenheit_to_celsius(value))
  }
}
