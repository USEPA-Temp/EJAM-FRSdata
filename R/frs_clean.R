#' clean Facility Registry System dataset
#' 
#' This is just a helper function used to create the dataset saved as data for use in EJAM
#'
#' @param frs output of frs_read
#'
#' @seealso \link{frs_get} which uses \link{frs_download} \link{frs_unzip} \link{frs_read} \link{frs_clean}
#'
#' @export
#'
frs_clean <- function(frs) {
  # could drop columns we do not need
  usefulcolumns <-  c('LATITUDE83', 'LONGITUDE83',  # might double check these are the best lat lon columns to use of the options
                      'REGISTRY_ID', 'PRIMARY_NAME', 
                      'SITE_TYPE_NAME', 'PGM_SYS_ACRNMS', 'INTEREST_TYPES', 
                      'NAICS_CODES', 'SIC_CODES')
  frs <- frs[ , colnames(frs) %in% usefulcolumns]
  # change to column names used by this package
  names(frs) <- gsub('LATITUDE83', 'lat', names(frs))
  names(frs) <- gsub('LONGITUDE83', 'lon', names(frs))
  
  frs <- frs[!is.na(frs$lat), ]  # a tibble (tbl) not just data.frame
  data.table::setDT(frs, key = c(NAICS_CODES, lat, lon))
  print('returns a data.table not tibble or plain data.frame')
  return(frs)
}
