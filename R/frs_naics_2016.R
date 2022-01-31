#' @name frs_naics_2016
#' @docType data
#' @title data.table of NAICS code(s) for each EPA-regulated site in Facility Registry System
#'  \preformatted{
#' one row per site-NAICS pair, so multple rows for one site if it is in multiple NAICS.
#' That file was called facdata in 2016. 
#' Renamed it frs_naics_2016 and 
#' will create a 2020 version of it from recent frs 
#' 
#'  head(frs_naics_2016)
#'  PROGRAM      PROGRAM_ID  REGISTRY_ID  NAICS      LAT      LONG
#'  1 RCRAINFO    PRD090122136 110000307668        18.41765 -66.14113
#'  2     TRIS 00619HBFLLCALLE 110000307668 325520 18.41765 -66.14113
#'  3     TRIS 00620RMCCH83EST 110000307695        18.37269 -66.14207
#'  4    CEDRI      CEDRI98261 110000307739        18.48514 -66.77732
#'  5     TRIS 00659CNTRLRD2KM 110000307739 311119 18.48514 -66.77732
#'  }
#'  
NULL



