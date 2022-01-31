#' download, unzip, read, clean the Facility Registry System dataset
#' 
#' This is just a helper function used to create the dataset saved as data for use in EJAM.
#'   A large share of all the FRS sites (a third perhaps?) have no latitude or longitude
#'   Those with lat lon have problems also:
#'   Some are are not in the USA.
#'   Some have errors in country code.
#'   Some use alternate ways of specifying USA.
#'
#' @param folder path
#' @param zfile name of zipfile
#' @param zipbaseurl url (without zipfile)
#' @param csvfile local filename from inside zip
#'
#' @seealso  \link{frs_get} which uses \link{frs_download} \link{frs_unzip} \link{frs_read} \link{frs_clean}
#'
#' @export
#'
frs_get <- function(folder='.', zfile = 'national_single.zip', zipbaseurl = 'https://ofmext.epa.gov/FLA/www3/state_files/', csvfile='NATIONAL_SINGLE.CSV') {
  # script to download and unzip EPA FRS
  frs_download(folder = folder, zfile = zfile, zipbaseurl = zipbaseurl)
  frs_unzip(zfile = file.path(folder, zfile))
  frs <- frs_read(file.path(folder, csvfile))
  frs <- frs_clean(frs) # drop if no latitude info, convert to data.table not tibble or simple data.frame
  return(frs)
  # save(frs, file = './data/frs.rdata')
  
  
  ######################################################################################################## #
  
  ######### TEST/ EXAMPLE SCRIPT and NOTES  ########
  # ON READING FRS (or download and unzip first then read)
  
  # > names(frs)
  # [1] "FRS_FACILITY_DETAIL_REPORT_URL" "REGISTRY_ID"                    "PRIMARY_NAME"                   "LOCATION_ADDRESS"               "SUPPLEMENTAL_LOCATION"
  # [6] "CITY_NAME"                      "COUNTY_NAME"                    "FIPS_CODE"                      "STATE_CODE"                     "STATE_NAME"
  # [11] "COUNTRY_NAME"                   "POSTAL_CODE"                    "FEDERAL_FACILITY_CODE"          "FEDERAL_AGENCY_NAME"            "TRIBAL_LAND_CODE"
  # [16] "TRIBAL_LAND_NAME"               "CONGRESSIONAL_DIST_NUM"         "CENSUS_BLOCK_CODE"              "HUC_CODE"                       "EPA_REGION_CODE"
  # [21] "SITE_TYPE_NAME"                 "LOCATION_DESCRIPTION"           "CREATE_DATE"                    "UPDATE_DATE"                    "US_MEXICO_BORDER_IND"
  # [26] "PGM_SYS_ACRNMS"                 "INTEREST_TYPES"                 "NAICS_CODES"                    "NAICS_CODE_DESCRIPTIONS"        "SIC_CODES"
  # [31] "SIC_CODE_DESCRIPTIONS"          "LATITUDE83"                     "LONGITUDE83"                    "CONVEYOR"                       "COLLECT_DESC"
  # [36] "ACCURACY_VALUE"                 "REF_POINT_DESC"                 "HDATUM_DESC"                    "SOURCE_DESC"
  # >
  
  # older code had all these fields in the facilities table: (compared to * in frs table)
  
  #   but not NAICS ???
  #
  # [1,] "X"                  * rownumber added later
  # [2,] "REGISTRY_ID"         = same as in frs
  # [3,] "FAC_NAME"           *   renamed?  "PRIMARY_NAME"
  # [4,] "FAC_STREET"         *  "LOCATION_ADDRESS"
  # [5,] "FAC_CITY"            *  "CITY_NAME"
  # [6,] "FAC_STATE"            * "STATE_NAME"
  # [7,] "FAC_ZIP"               * "POSTAL_CODE"
  # [8,] "FAC_COUNTY"            * COUNTY_NAME"
  # [9,] "FAC_FIPS_CODE"         * "FIPS_CODE"
  # [10,] "FAC_EPA_REGION"        * "EPA_REGION_CODE"
  # [11,] "FAC_INDIAN_CNTRY_FLG"  * "TRIBAL_LAND_CODE" ?
  # [12,] "FAC_FEDERAL_FLG"       * "FEDERAL_FACILITY_CODE" ?
  # [13,] "FAC_US_MEX_BORDER_FLG"  "US_MEXICO_BORDER_IND"
  # [14,] "FAC_CHESAPEAKE_BAY_FLG"  ?
  # [15,] "FAC_NAA_FLAG"            ?
  # [16,] "FAC_LAT"               * "LATITUDE83"
  # [17,] "FAC_LONG"              * "LONGITUDE83"
  # [18,] "FACT_LAT_RAD"          ... calculated later
  # [19,] "FACT_LONG_RAD"         ... calculated later
  # [20,] "FAC_X"                 ... calculated later
  # [21,] "FAC_Y"                 ... calculated later
  # [22,] "FAC_Z"                 ... calculated later
  
  
  #     frs <- frs_get(folder='~/Downloads')
  # or if already unzipped in working directory:
  #     library(readr)
  #     frs <- frs_read()
  #
  # > dim(frs)
  # [1] 4457317      39
  # t(frs[11,])
  #
  # MANY ARE MISSING LATITUDE info
  #
  # > table(is.na(frs$LATITUDE83))
  #
  # FALSE    TRUE
  # 3144206 1313111   # only 3.1 million have latitude, 1.3m do not
  
  ######### THEN DROP ROWS WITHOUT LATITUDE INFO ####### #
  #
  #     frs <- frs_clean(frs)
  
  # > dim(frs)
  # [1] 3144206      39
  
  #### save as Rdata for package?? ####
  
  # facilities <- frs
  # save(facilities, file = './data/facilities.rdata')
  ## or maybe save as frs?
  # save(frs, file = './data/frs.rdata')
  
  
  #### NOTES ON FRS DATA 2021
  #
  # some are not in USA,
  # some have errors in country code,
  # some use alternate ways of specifying USA:
  #
  # cbind(sort(table(frs$COUNTRY_NAME, useNA = 'always')))
  # [,1]
  # BR                            1
  # CA                            1
  # CALIFORNIA                    1
  # GREAT BRITAIN (UK)            1
  # HONG KONG                     1
  # INDIA                         1
  # MEXICO                        1
  # THE GAMBIA                    1
  # URUGUAY                       1
  # UZBEKISTAN                    1
  # KS                            2
  # AMERICAN SAMOA                3
  # BRAZIL                        3
  # ALBANIA                       5
  # CANADA                        5
  # UNITED KINGDOM                6
  # CHINA                         8
  # AFGHANISTAN                  14
  # NEW JERSEY                   14
  # UNITED STATES OF AMERICA    151
  # US                         1182
  # ARKANSAS                   1946
  # USA                       60619
  # <NA>                     158260
  # U.S.A.                   181014
  # UNITED STATES            596758
  
  # > table(frs$SITE_TYPE_NAME)  # not a huge percent of facilities have this code at all:
  #
  # BARGE              BROWNFIELDS SITE             CONTAMINATED SITE       CONTAMINATION ADDRESSED                      FACILITY                        MOBILE
  #    6                         30018                          2312                           163                         77474                            73
  #
  # MONITORING STATION                      PIPELINE                  PORTABLE    POTENTIALLY CONTAMINATED SITE                    STATIONARY                  WATER SYSTEM
  #               6182                             8                      5656                             8691                       3749046                        358729
  #
  # WATERFRONT FACILITY
  #                 19
  
  
}

