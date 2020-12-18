
#Initial set up 
##Run only first time

install.packages("devtools")
install.packages("usethis")

library(devtools)



###############-----------------------------#################

library(geonapi)

#Setting up GeoNetwork API

GN <- GNManager$new(
  url = "https://metadata.micronutrient.support/geonetwork", #base URL of the Geonetwork
  version = "3.10.4.0",
  user = "lucia", pwd = "02/Jun/1987", #credentials (ignore if you want to connect as anonymous user for metadata reading)
  logger = NULL
)


#Creating a metadata record (from an existing file)

mdfile <- system.file("extdata/examples", "metadata.xml", package = "geonapi")

mdfile1 <- "C:/Users/LuciaSegoviaDeLaRevi/OneDrive - London School of Hygiene and Tropical Medicine/MAPS/03_open-science/R_MAPS_open-science/data_metadata/ihs4_metadata.xml"

created = GN$insertMetadata(file = mdfile, group = "1", category = "datasets")

created1 = GN$insertMetadata(file = mdfile1, group = "1", category = "datasets")

config <- GNPrivConfiguration$new()

config$setPrivileges("all", c("view","dynamic","featured"))

GN$setPrivConfiguration(id = created, config = config)


id <- "96c0b0e3-dfec-4a29-ac06-49ae40d9e960" 

md <- GN$getMetadataByUUID(id)

