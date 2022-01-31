#' read Facility Registry System dataset
#' 
#' This is just a helper function used to create the dataset saved as data for use in EJAM
#'
#' @param csvfile output of frs_unzip
#' @param ... passed to readr::read_csv 
#'
#' @seealso \link{frs_get} which uses \link{frs_download} \link{frs_unzip} \link{frs_read} \link{frs_clean}
#'
#' @export
#'
frs_read <- function(csvfile= 'NATIONAL_SINGLE.CSV', ...) {
  # library(readr)
  my_col_types <- readr::cols(
    FRS_FACILITY_DETAIL_REPORT_URL = readr::col_character(),
    REGISTRY_ID = col_character(),
    PRIMARY_NAME = col_character(),
    LOCATION_ADDRESS = col_character(),
    SUPPLEMENTAL_LOCATION = col_character(),
    CITY_NAME = col_character(),
    COUNTY_NAME = col_character(),
    FIPS_CODE = col_character(),   # can preserve leading zeroes but wastes space
    STATE_CODE = col_character(),
    STATE_NAME = col_character(),
    COUNTRY_NAME = col_character(),
    POSTAL_CODE = col_character(),
    FEDERAL_FACILITY_CODE = col_character(),
    FEDERAL_AGENCY_NAME = col_character(),
    TRIBAL_LAND_CODE = col_character(),
    TRIBAL_LAND_NAME = col_character(),
    CONGRESSIONAL_DIST_NUM = col_integer(),
    CENSUS_BLOCK_CODE = col_character(), # can preserve leading zeroes but wastes space
    HUC_CODE = col_character(),
    EPA_REGION_CODE = col_integer(),
    SITE_TYPE_NAME = col_character(),
    LOCATION_DESCRIPTION = col_character(),
    CREATE_DATE = col_date(format = '%d-%b-%y'),
    UPDATE_DATE = col_date(format = '%d-%b-%y'),
    US_MEXICO_BORDER_IND = col_character(),
    PGM_SYS_ACRNMS = col_character(),  # csv like  AIR:AK0000000201000026, AIRS/AFS:0201000026, NPDES:AK0020630, RCRAINFO:AK6690360312, RCRAINFO:AKR000206516"
    INTEREST_TYPES = col_character(), # csv like "AIR SYNTHETIC MINOR, ICIS-NPDES NON-MAJOR, UNSPECIFIED UNIVERSE"
    NAICS_CODES = col_character(),  # csv of NAICS
    NAICS_CODE_DESCRIPTIONS = col_character(), # csv?
    SIC_CODES = col_character(),  #csv
    SIC_CODE_DESCRIPTIONS = col_character(),  #csv
    LATITUDE83 = col_double(),   ###
    LONGITUDE83 = col_double(),  ###
    CONVEYOR = col_character(),
    COLLECT_DESC = col_character(),
    ACCURACY_VALUE = col_double(),
    REF_POINT_DESC = col_character(),
    HDATUM_DESC = col_character(),
    SOURCE_DESC = col_logical()
  )
  frs <- readr::read_csv(file = csvfile, col_types = my_col_types, ...)
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
