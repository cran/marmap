getNOAA.bathy <-
function(lon1,lon2,lat1,lat2, resolution = 4){
	
	x1=x2=y1=y2 = NULL
	
	if (lon1 < lon2) {lon1->x1 ; lon2->x2} else {lon1->x2 ; lon2->x1}
	if (lat1 < lat2) {lat1->y1 ; lat2->y2} else {lat1->y2 ; lat2->y1}
	
	res = resolution * 0.016666666666666667
	
	# ## Estimate download time: 
	# abs(x2-x1) * abs(y2-1) * res -> size.matrix
	# ETA = exp(-1.3983 * log(size.matrix) + 7.8788)

	paste("http://mapserver.ngdc.noaa.gov/wcs-proxy/wcs.groovy?filename=etopo1.xyz&request=getcoverage&version=1.0.0&service=wcs&coverage=etopo1&CRS=EPSG:4326&format=xyz&resx=",res,"&resy=",res,"&bbox=",x1,",",y1,",",x2,",",y2, sep="") -> WEB.REQUEST

	cat("Querying NOAA database ...\n")
	cat("This may take seconds to minutes, depending on grid size\n")
	# cat(paste("(estimated download time of",round(ETA, 1),"sec)\n"))
	read.table(WEB.REQUEST) -> bath	
	
	cat("Building bathy matrix ...\n")	
	as.bathy(bath) -> bath
	return(bath)
	
}
