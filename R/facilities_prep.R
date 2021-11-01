facilities_prep <- function(facilitydatalocation='') {

  # THIS IS PROBABLY ALL OBSOLETE CODE
  # SEE frs_get.R
  #

  ########### LOAD FACILITY POINTS, FOR ALL NAICS ###########

  # Load all EPA-regulated facility lat lon data from facilitydatalocation as facilities data.table
  #  THIS IS FOR ALL FACILITIES IN THE FRS
  # started with this:  "EPA_sample_facilities.rds"
  cat('reading facility data from ', facilitydatalocation, '\n')
  tmp <- data.table::as.data.table(readRDS(facilitydatalocation))
  #internal conversion to uppercase
  #tmp <- data.table::as.data.table(readRDS("source_data/facdata.rds"))
  names(tmp) <- toupper(names(tmp))
  # env$facilities <- subset(tmp, !is.na(LAT))  # LAT may not be the name of that column actually
  facilities <- subset(tmp, !is.na(FAC_LAT)) # A HUGE PERCENTAGE OF THE FACILITIES HAVE NA FOR LAT, FOR SOME REASON, IN THAT OLDER DATASET 2016 OR SO
  facilities <- data.table::as.data.table(env$facilities) #[,.(ID,LAT,LONG)])
  #env$facilities <- data.table::as.data.table(env$facilities[,.(ID,LAT,LONG)])
  # return(facilities)
}
