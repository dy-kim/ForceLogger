#' @export
FORCE_TRACE <- function(fmt, ...) {
  msg <- FORCE_BASE(fmt, ...)
  flog.trace(msg, name = 'ROOT')
  flog.trace(msg, name = LOGGER_NAME)
}

#' @export
FORCE_DEBUG <- function(fmt, ...) {
  msg <- FORCE_BASE(fmt, ...)
  flog.debug(msg, name = 'ROOT')
  flog.debug(msg, name = LOGGER_NAME)
}

#' @export
FORCE_INFO <- function(fmt, ...) {
  msg <- FORCE_BASE(fmt, ...)
  flog.info(msg, name = 'ROOT')
  flog.info(msg, name = LOGGER_NAME)
}

#' @export
FORCE_WARN <- function(fmt, ...) {
  msg <- FORCE_BASE(fmt, ...)
  flog.warn(msg, name = 'ROOT')
  flog.warn(msg, name = LOGGER_NAME)
}

#' @export
FORCE_ERROR <- function(fmt, ...) {
  msg <- FORCE_BASE(fmt, ...)
  flog.error(msg, name = 'ROOT')
  flog.error(msg, name = LOGGER_NAME)
}

#' @export
FORCE_FATAL <- function(fmt, ...) {
  msg <- FORCE_BASE(fmt, ...)
  flog.fatal(msg, name = 'ROOT')
  flog.fatal(msg, name = LOGGER_NAME)
  stop(msg)
}

FORCE_BASE <- function(fmt, ...) {
  return(sprintf(fmt, ...))
}
