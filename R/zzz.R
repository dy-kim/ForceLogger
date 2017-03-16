#' @import futile.logger
NULL

.onAttach <- function(libname, pkgname) {
  printPkgVersion(pkgname)
}

printPkgVersion <- function(pkgname) {
  ver <- read.dcf(file = system.file("DESCRIPTION", package = pkgname),
                  fields = "Version")
  packageStartupMessage("Package ", pkgname, " (", ver, ") loaded.")
}

.onLoad <- function(libname, pkgname) {
  SETUP_FORCE_LOGGER(threshold = "FATAL")
}
