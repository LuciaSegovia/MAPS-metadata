

#Example of ISO 19115/19139 metadata generated with geometa
#This example is valid according to INSPIRE common metadata requirements

md = ISOMetadata$new()
md$setFileIdentifier("malawi-food-composition-dataset-metadata")
md$setParentIdentifier("food-composition-dataset-metadata")
md$setCharacterSet("utf8")
md$setLanguage("eng")
md$setDateStamp(ISOdate(2015, 1, 1, 1))
md$setMetadataStandardName("ISO 19115:2003/19139")
md$setMetadataStandardVersion("1.0")
md$setDataSetURI("malawi-food-composition-dataset")

#Adding one contact

rp <- ISOResponsibleParty$new()
rp$setIndividualName("Lucia Segovia de la Revilla")
rp$setOrganisationName("LSHTM")
rp$setPositionName("Research Assistant")
rp$setRole("pointOfContact")
contact <- ISOContact$new()
#phone <- ISOTelephone$new()
#phone$setVoice(paste0("myphonenumber",i))
#phone$setFacsimile(paste0("myfacsimile",i))
#contact$setPhone(phone)
address <- ISOAddress$new()
#address$setDeliveryPoint("theaddress")
#address$setCity("thecity")
#address$setPostalCode("111")
#address$setCountry("France")
address$setEmail("Lucia.Segovia-De-La-Revilla@lshtm.ac.uk")
contact$setAddress(address)
res <- ISOOnlineResource$new()
res$setLinkage("https://www.lshtm.ac.uk/aboutus/people/segovia-de-la-revilla.lucia")
res$setName("LSHTM profile")
contact$setOnlineResource(res)
rp$setContactInfo(contact)
md$addContact(rp)

#VectorSpatialRepresentation
vsr <- ISOVectorSpatialRepresentation$new()
vsr$setTopologyLevel("geometryOnly")
geomObject <- ISOGeometricObjects$new()
geomObject$setGeometricObjectType("surface")
geomObject$setGeometricObjectCount(5L)
vsr$setGeometricObjects(geomObject)
md$addSpatialRepresentationInfo(vsr)

