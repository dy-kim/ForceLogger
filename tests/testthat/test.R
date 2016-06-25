context("logging of ForceLogger")

test_that("learn)", {
  FORCE_SET_LOGGING(threshold = "TRACE", logging = TRUE)
  FORCE_TRACE("%s test", "FORCE_TRACE")
  FORCE_DEBUG("%s test", "FORCE_DEBUG")
  FORCE_INFO("%s test", "FORCE_INFO")
  FORCE_WARN("%s test", "FORCE_WARN")
  FORCE_ERROR("%s test", "FORCE_ERROR")
  tryCatch(
    expr = FORCE_FATAL("%s test", "FORCE_FATAL"),
    error = function(e) {
      print(sprintf("Catched: %s", e$message))
    }
  )
})
