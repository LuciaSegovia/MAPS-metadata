
#Initial set up 
##Run only first time

install.packages("devtools")
install.packages("usethis")

library(devtools)

#dzvoti


###############-----------------------------#################

library(geometa)
library(geonapi)

#Setting up GeoNetwork API

user <- "your-user-name"
pass <- "your-password"

GN <- GNManager$new(
  url = "https://metadata.micronutrient.support/geonetwork", #base URL of the Geonetwork
  version = "3.10.4.0",
  user = user, pwd = pass, #credentials (ignore if you want to connect as anonymous user for metadata reading)
  logger = "DEBUG"
)


#Creating a metadata record (from an existing file)

mdfile <- system.file("extdata/examples", "metadata.xml", package = "geonapi")

created = GN$insertMetadata(file = mdfile, group = "1", category = "datasets")

config <- GNPrivConfiguration$new()

config$setPrivileges("all", c("view","dynamic","featured"))

GN$setPrivConfiguration(id = created, config = config)


id <- "d38a8576-ecf1-429d-bc4b-6db346dc3c6e" 

test <- GN$getMetadataByUUID(id)

