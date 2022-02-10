# create the smaller lookup table for just matching on NAICS to get lat lon registry_id


frs_make_naics_lookup <- function(x) {
  
  # input is frs, the output of frs_clean, a data.table
  # 
  # Classes ‘data.table’ and 'data.frame':	3144206 obs. of  9 variables:
  # - attr(*, ".internal.selfref")=<externalptr> 
  #   
  # REGISTRY_ID     e.g. 110058283236
  # PRIMARY_NAME    e.g. ZYX NAMED POWER PLANT
  # SITE_TYPE_NAME  e.g. STATIONARY
  # PGM_SYS_ACRNMS  e.g. AIR:AK0000000201600016, AIRS/AFS:0201600016, EIS:12660311
  # INTEREST_TYPES  e.g. ICIS-NPDES NON-MAJOR, STORM WATER INDUSTRIAL
  # NAICS_CODES     e.g. NA or    "221310, 311710, 311712"
  # SIC_CODES       e.g. NA or    "4952, 9711, OWNE" 
  # LAT             numeric
  # LON             numeric
  # 
  # c("REGISTRY_ID", "PRIMARY_NAME", "SITE_TYPE_NAME", "PGM_SYS_ACRNMS", 
  #   "INTEREST_TYPES", "NAICS_CODES", "SIC_CODES", "LAT", "LONG")
  
  x <- x[ , .(REGISTRY_ID, NAICS, PGM_SYS_ACRNMS, lat, lon)]
  
  
  warning('not finished with this yet ')
  print('this is not at all tested ')
  
  xlong <- tidyr::separate_rows(x, "NAICS_CODES", sep = ',')
  xlong$PRIMARY_NAME <- NULL
  
  xlong$INTEREST_TYPES <- NULL
  xlong$PGM_SYS_ACRNMS <- NULL
  
  xlong$SITE_TYPE_NAME <- NULL
  xlong$SIC_CODES <- NULL
  
  xlong <- data.table::as.data.table(xlong)
  
#  head(x,20)
#   head(xlong, 20)
  

  invisible(xlong)
  
  # 
  # > str(x)  # frs as of 2022 download
  # Classes ‘data.table’ and 'data.frame':	3185964 obs. of  5 variables:
  #   $ REGISTRY_ID   : chr  "110058283236" "110071102848" "110038070002" "110070215939" ...
  # $ PGM_SYS_ACRNMS: chr  "NPDES:AKU000292" "SEMS:AK4170024323" "BRAC:AK4170024323, EIS:10606011, ICIS:22754, NCDB:C10#10-00179-01-ADL, NCDB:C10#10-88028-01-WR, NCDB:D10#10-900"| __truncated__ "NPDES:AKR06AA03" ...
  # $ NAICS         : chr  NA NA NA NA ...
  # $ lat           : num  51.9 51.9 51.9 51.9 51.9 ...
  # $ lon           : num  -177 -177 -177 -177 -177 ...
  # - attr(*, ".internal.selfref")=<externalptr> 
  #   - attr(*, "sorted")= chr "NAICS"
  # - attr(*, "index")= int(0) 
  # ..- attr(*, "__REGISTRY_ID")= int [1:3185964] 2702853 2003156 2630327 2628695 2577016 2650824 2702857 2554626 2655269 2816289 ...
  # - attr(*, "date")= Date[1:1], format: "2022-02-09"
  # # > 
  
  
  # tibble [3,352,822 x 4] (S3: tbl_df/tbl/data.frame)
  # $ REGISTRY_ID: chr [1:3352822] "110058283236" "110038070002" "110070215939" "110015787683" ...
  # $ NAICS_CODES: chr [1:3352822] NA NA NA "928110" ...
  # $ LAT        : num [1:3352822] 51.9 51.9 51.9 51.9 51.9 ...
  # $ LONG       : num [1:3352822] -177 -177 -177 -177 -177 ...
  
  
  #   > str(frs_naics_2016)
  # 'data.frame':	1847061 obs. of  6 variables:
  #   $ PROGRAM    : Factor w/ 22 levels "AIRS/AFS","BR",..: 15 21 21 4 21 20 15 17 17 15 ...
  # $ PROGRAM_ID : Factor w/ 1718088 levels "000003GA001",..: 1511957 1384 1391 590866 1538 424 1512071 65002 65002 1511948 ...
  # $ REGISTRY_ID: num  1.1e+11 1.1e+11 1.1e+11 1.1e+11 1.1e+11 ...
  # $ NAICS      : Factor w/ 2693 levels "","1","10","1005",..: 1 791 1 1 445 1 1 450 536 540 ...
  # $ LAT        : num  18.4 18.4 18.4 18.5 18.5 ...
  # $ LONG       : num  -66.1 -66.1 -66.1 -66.8 -66.8 ...
  # 
  # frs_naics_2020
  
}