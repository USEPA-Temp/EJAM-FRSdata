#' download Facility Registry System dataset
#' 
#' This is just a helper function used to create the dataset saved as data for use in EJAM
#'
#' @param folder path
#' @param zfile filename
#' @param zipbaseurl url
#'
#' @seealso  \link{frs_get} which uses \link{frs_download} \link{frs_unzip} \link{frs_read} \link{frs_clean}
#' 
#' @export
#'
frs_download <- function(folder='.', zfile = 'national_single.zip', zipbaseurl = 'https://ofmext.epa.gov/FLA/www3/state_files/') {
  download.file(url = file.path(zipbaseurl, zfile), destfile = file.path(folder, zfile))
  # These should be able to download and cleanup the EPA Facility Registry System data
  # for use in a package
  # library(readr)
  }
