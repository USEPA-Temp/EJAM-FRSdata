#' @name facilities
#' @docType data
#' @title data.table of locations of points such as EPA-regulated facilities
#'
#' This is an old file you could get sites from via registry ID lookup, not NAICS.
#' 
#' Needs to be updated to latest data available... see \link{frs}
#'
#' and why does it have to use facilities_prep() instead of just doing that before saving the dataset and building the package?
#'
#' The 2016 version had 1,129,481 rows (facilities), 22 columns:
#' (2016 Facility Registry System FRS version was 98 MB as .rdata, for 1.1m EPA-regulated facilities)
#'   \preformatted{
#'   Classes ‘data.table’ and 'data.frame':	1,129,481 obs. of  22 variables:
#' $ X                     : int  1 2 3 ...  Rownumber or unique ID
#' $ REGISTRY_ID           : num       ***EPA facility registry system ID
#' $ FAC_NAME              : Factor w/ 1474436 levels
#' $ FAC_STREET            : Factor w/ 1181505 levels
#' $ FAC_CITY              : Factor w/ 36799 levels
#' $ FAC_STATE             : Factor w/ 71 levels
#' $ FAC_ZIP               : Factor w/ 39257 levels
#' $ FAC_COUNTY            : Factor w/ 4888 levels   County FIPS (5 digits)
#' $ FAC_FIPS_CODE         : Factor w/ 6505 levels
#' $ FAC_EPA_REGION        : int
#' $ FAC_INDIAN_CNTRY_FLG  : Factor w/ 3 levels "","N","Y"
#' $ FAC_FEDERAL_FLG       : Factor w/ 4 levels "","N","U","Y"
#' $ FAC_US_MEX_BORDER_FLG : Factor w/ 3 levels "","N","Y"
#' $ FAC_CHESAPEAKE_BAY_FLG: Factor w/ 2 levels "","Y"
#' $ FAC_NAA_FLAG          : Factor w/ 2 levels "","Y"
#' $ FAC_LAT               : num  34.7 ...   ***Latitude in decimal degrees
#' $ FAC_LONG              : num  -118.1  ...  ***Longitude in decimal degrees
#' $ FACT_LAT_RAD          : num  0.605  ...    in radians
#' $ FACT_LONG_RAD         : num  -2.06  ...    in radians
#' $ FAC_X                 : num  -1535.2  ... x location for quadtree
#' $ FAC_Y                 : num  -2871  ... y location for quadtree
#' $ FAC_Z                 : num  2253  ... z location for quadtree
#' - attr(*, ".internal.selfref")=<externalptr>
#'
#'   }
NULL
