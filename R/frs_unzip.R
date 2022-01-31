#' unzip Facility Registry System dataset
#' 
#' This is just a helper function used to create the dataset saved as data for use in EJAM
#'
#' @param zfile zipfile obtained via frs_download
#' @param ... passed to unzip
#'
#' @seealso  \link{frs_get} which uses \link{frs_download} \link{frs_unzip} \link{frs_read} \link{frs_clean}
#'
#' @export
#'
frs_unzip <- function(zfile='national_single.zip', ...) {
  unzip(zipfile = zfile, ...)
}
