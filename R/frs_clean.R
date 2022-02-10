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
frs_clean <- function(frs, usefulcolumns=c('LATITUDE83', 'LONGITUDE83', 'REGISTRY_ID', 'PRIMARY_NAME', 'NAICS_CODES', 'PGM_SYS_ACRNMS')) {

  # REGISTRY_ID = 'c',
  # PRIMARY_NAME = 'c',
  # PGM_SYS_ACRNMS = 'c',  # csv like  AIR:AK0000000201000026, AIRS/AFS:0201000026, NPDES:AK0020630, RCRAINFO:AK6690360312, RCRAINFO:AKR000206516"
  # INTEREST_TYPES = 'c', # csv like "AIR SYNTHETIC MINOR, ICIS-NPDES NON-MAJOR, UNSPECIFIED UNIVERSE"
  # NAICS_CODES = 'c',  # csv of NAICS
  # NAICS_CODE_DESCRIPTIONS = 'c', # csv?
  # SIC_CODES = 'c',  #csv
  # SIC_CODE_DESCRIPTIONS = 'c',  #csv
  # LATITUDE83 = 'd',   ###
  # LONGITUDE83 = 'd'
  
  frs <- frs[ , colnames(frs) %in% usefulcolumns]
  
  # change to column names used by this package
  names(frs) <- gsub('LATITUDE83', 'lat', names(frs))
  names(frs) <- gsub('LONGITUDE83', 'lon', names(frs))
  names(frs) <- gsub('NAICS_CODES', 'NAICS', names(frs))
  
  # DROP THOSE LACKING LOCATION INFORMATION
  frs <- frs[!is.na(frs$lat), ]  # a tibble (tbl) not just data.frame
  frs <- as.data.frame(frs)
  frs$PRIMARY_NAME <- NULL # save space
  
  frs <- data.table::as.data.table(frs)
  data.table::setkey(frs, NAICS)
  data.table::setindex(frs, REGISTRY_ID)

    # print('returns a data.table not tibble or plain data.frame')
  # print(colnames(frs))
  return(frs)
}
