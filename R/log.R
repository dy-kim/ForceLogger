#' @export
FORCE_SET_LOGGING <-
  function(threshold = c("INFO", "TRACE", "DEBUG", "WARN", "ERROR", "FATAL"),
           logging = FALSE) {
    if (missing(threshold))
      threshold_type <- "INFO"

    threshold <- match.arg(threshold)
    threshold_type <-
      switch(
        EXPR = threshold,
        TRACE = TRACE,
        DEBUG = DEBUG,
        INFO = INFO,
        WARN = WARN,
        ERROR = ERROR,
        FATAL = FATAL
      )

    assign("force_log_logging_", logging, envir = .GlobalEnv)
    flog.appender(force_log_handler(), name = "force")
    flog.threshold(threshold_type, name = "force")
    layout <- layout.format("[~l][~t][~n.~f] ~m")
    flog.layout(layout, name = "force")
  }

#' @export
force_log_handler <- function() {
  function(line) {
    if (force_log_logging_) {
      cat(line, sep = "", file = stderr())
    }
  }
}

#' @export
FORCE_TRACE <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.trace(msg, name = "force")
}

#' @export
FORCE_DEBUG <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.debug(msg, name = "force")
}

#' @export
FORCE_INFO <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.info(msg, name = "force")
}

#' @export
FORCE_WARN <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.warn(msg, name = "force")
}

#' @export
FORCE_ERROR <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.error(msg, name = "force")
}

#' @export
FORCE_FATAL <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.fatal(msg, name = "force")
  stop(msg)
}
