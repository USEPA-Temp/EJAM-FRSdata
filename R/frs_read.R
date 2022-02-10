#' read Facility Registry System dataset
#' 
#' @description This is just a helper function used to create the dataset saved as data for use in EJAM
#'  Using readr::read_csv here this way is extremely slow, for some reason. million of rows.
#' @details 
#' \preformatted{
#' 
#' Source code for \link{frs_get} has more details on which fields might be useful.
#'  
#'  
#' }
#'  
#' @param csvfile output of frs_unzip
#' @param get_only_essential_cols whether to keep only a few columns needed for EJAM package
#' @param ... passed to readr::read_csv 
#' 
#' @seealso \link{frs_get} which uses \link{frs_download} \link{frs_unzip} \link{frs_read} \link{frs_clean}
#' 
#' @export
#'
frs_read <- function(csvfile= 'NATIONAL_SINGLE.CSV', get_only_essential_cols = FALSE, ...) {
  # library(readr)
  if (get_only_essential_cols) {
    my_col_types <- readr::cols_only(
      REGISTRY_ID = 'c',
      PRIMARY_NAME = 'c',
      PGM_SYS_ACRNMS = 'c',  # csv like  AIR:AK0000000201000026, AIRS/AFS:0201000026, NPDES:AK0020630, RCRAINFO:AK6690360312, RCRAINFO:AKR000206516"
      INTEREST_TYPES = 'c', # csv like "AIR SYNTHETIC MINOR, ICIS-NPDES NON-MAJOR, UNSPECIFIED UNIVERSE"
      NAICS_CODES = 'c',  # csv of NAICS
      NAICS_CODE_DESCRIPTIONS = 'c', # csv?
      SIC_CODES = 'c',  #csv
      SIC_CODE_DESCRIPTIONS = 'c',  #csv
      LATITUDE83 = 'd',   ###
      LONGITUDE83 = 'd'
    )
    frs <- readr::read_csv(file = csvfile, col_types = my_col_types, ...)
    
  } else {
    
  my_col_types <- list(
    FRS_FACILITY_DETAIL_REPORT_URL = 'c',
    REGISTRY_ID = 'c',
    PRIMARY_NAME = 'c',
    LOCATION_ADDRESS = 'c',
    SUPPLEMENTAL_LOCATION = 'c',
    CITY_NAME = 'c',
    COUNTY_NAME = 'c',
    FIPS_CODE = 'c',   # can preserve leading zeroes but wastes space
    STATE_CODE = 'c',
    STATE_NAME = 'c',
    COUNTRY_NAME = 'c',
    POSTAL_CODE = 'c',
    FEDERAL_FACILITY_CODE = 'c',
    FEDERAL_AGENCY_NAME = 'c',
    TRIBAL_LAND_CODE = 'c',
    TRIBAL_LAND_NAME = 'c',
    CONGRESSIONAL_DIST_NUM = 'i',
    CENSUS_BLOCK_CODE = 'c', # can preserve leading zeroes but wastes space
    HUC_CODE = 'c',
    EPA_REGION_CODE = 'i',
    SITE_TYPE_NAME = 'c',  # not a huge percent of facilities have this code at all
    LOCATION_DESCRIPTION = 'c',
    CREATE_DATE = readr::col_date(format = '%d-%b-%y'),
    UPDATE_DATE = readr::col_date(format = '%d-%b-%y'),
    US_MEXICO_BORDER_IND = 'c',
    PGM_SYS_ACRNMS = 'c',  # csv like  AIR:AK0000000201000026, AIRS/AFS:0201000026, NPDES:AK0020630, RCRAINFO:AK6690360312, RCRAINFO:AKR000206516"
    INTEREST_TYPES = 'c', # csv like "AIR SYNTHETIC MINOR, ICIS-NPDES NON-MAJOR, UNSPECIFIED UNIVERSE"
    NAICS_CODES = 'c',                   # csv of NAICS
    NAICS_CODE_DESCRIPTIONS = 'c',   # csv?
    SIC_CODES = 'c',  #csv
    SIC_CODE_DESCRIPTIONS = 'c',  #csv
    LATITUDE83 = 'd',   ###
    LONGITUDE83 = 'd',  ###
    CONVEYOR = 'c',
    COLLECT_DESC = 'c',
    ACCURACY_VALUE = 'd',
    REF_POINT_DESC = 'c',
    HDATUM_DESC = 'c',
    SOURCE_DESC = 'l'
  )
  frs <- readr::read_csv(file = csvfile, col_types = my_col_types, ...)
  
  }
  
  return(frs)
  
  # > dim(frs)
  # # [1] 4457317      39
  # # > table(is.na(frs$LATITUDE83))
  # #
  # # FALSE    TRUE
  # # 3144206 1313111   # only 3.1 million have latitude, 1.3m do not
  #> table(is.na(frs$NAICS_CODES))
  #
  # FALSE    TRUE
  # 919837 3537480
}
