LOGGER_NAME <- "force"

#' @export
SETUP_FORCE_LOGGER <- function(threshold = "FATAL",
                               logFilePath = getOption("log.file.path")) {
  threshold <-
    match.arg(toupper(threshold),
              choices = c("TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"))
  FORCE_THRESHOLD(threshold)

  if (!is.null(logFilePath)) {
    FORCE_FILE_APPENDER(logFilePath)
  } else {
    FORCE_NULL_APPENDER()
  }

  invisible(FORCE_LAYOUT())
}

#' @export
FORCE_THRESHOLD <- function(threshold) {
  thresholdType <-
    switch(
      EXPR = threshold,
      TRACE = TRACE,
      DEBUG = DEBUG,
      INFO = INFO,
      WARN = WARN,
      ERROR = ERROR,
      FATAL = FATAL
    )

  flog.threshold(thresholdType)
  flog.threshold(TRACE, name = LOGGER_NAME)
}

#' @export
FORCE_FILE_APPENDER <-
  function(logFilePath = getOption("log.file.path")) {
    if (is.null(logFilePath)) {
      stop("invalid connection; argument 'logFilePath' is NULL")
    }

    FORCE_APPENDER(appender.file(logFilePath))
  }

FORCE_APPENDER <- function(x) {
  flog.appender(x, name = LOGGER_NAME)
}

FORCE_NULL_APPENDER <- function() {
  FORCE_APPENDER(function(line) {
    invisible(NULL)
  })
}

FORCE_LAYOUT <- function() {
  customizedJsonLayout <-
    layout.format(format = '{"level":"~l","timestamp":"~t","namespace":"~n","function":"~f","message":"~m"}',
                  datetime.fmt = "%Y-%m-%dT%H:%M:%S%z")

  flog.layout(customizedJsonLayout, name = LOGGER_NAME)
}
