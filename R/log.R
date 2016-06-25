#threshold : "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"
FORCE_SET_LOGGING <- function(threshold = "INFO",
                              logging = FALSE) {
  if (threshold == "TRACE")
    threshold_type <- TRACE
  else if (threshold == "DEBUG")
    threshold_type <- DEBUG
  else if (threshold == "INFO")
    threshold_type <- INFO
  else if (threshold == "WARN")
    threshold_type <- WARN
  else if (threshold == "ERROR")
    threshold_type <- ERROR
  else if (threshold == "FATAL")
    threshold_type <- FATAL
  else
    threshold_type <- INFO
  
  assign("force_log_logging_", logging, envir = .GlobalEnv)
  flog.appender(force_log_handler(), name = "force")
  flog.threshold(threshold_type, name = "force")
  layout <- layout.format('[~l][~t][~n.~f] ~m')
  flog.layout(layout, name = "force")
}

force_log_handler <- function()
{
  function(line) {
    if (force_log_logging_) {
      cat(line, sep = '', file = stderr())
    }
  }
}

FORCE_TRACE <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.trace(msg, name = "force")
}

FORCE_DEBUG <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.debug(msg, name = "force")
}

FORCE_INFO <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.info(msg, name = "force")
}

FORCE_WARN <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.warn(msg, name = "force")
}

FORCE_ERROR <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.error(msg, name = "force")
}

FORCE_FATAL <- function(fmt, ...) {
  msg <- sprintf(fmt, ...)
  flog.fatal(msg, name = "force")
  stop(msg)
}