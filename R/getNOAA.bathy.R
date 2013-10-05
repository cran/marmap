getNOAA.bathy <-
function(lon1,lon2,lat1,lat2, resolution = 4, keep=FALSE){
	
	x1=x2=y1=y2 = NULL
	
	if (lon1 < lon2) {lon1->x1 ; lon2->x2} else {lon1->x2 ; lon2->x1}
	if (lat1 < lat2) {lat1->y1 ; lat2->y2} else {lat1->y2 ; lat2->y1}
	
	res = resolution * 0.016666666666666667
	
	paste("marmap_coord_",x1,":",y1,":",x2,":",y2,"_res_",resolution,".csv", sep="") -> FILE
	
	if(FILE %in% list.files() ) {
		cat("File already exists ; loading \'", FILE,"\'", sep="")
		read.bathy(FILE, header=T) -> exisiting.bathy
		return(exisiting.bathy)
	} else {

		paste("http://mapserver.ngdc.noaa.gov/wcs-proxy/wcs.groovy?filename=etopo1.xyz&request=getcoverage&version=1.0.0&service=wcs&coverage=etopo1&CRS=EPSG:4326&format=xyz&resx=",res,"&resy=",res,"&bbox=",x1,",",y1,",",x2,",",y2, sep="") -> WEB.REQUEST
		
		cat("Querying NOAA database ...\n")
		cat("This may take seconds to minutes, depending on grid size\n")
		
		suppressWarnings(try(read.table(WEB.REQUEST),silent=TRUE)) -> bath
		
		if (is(bath,"try-error")) {
			stop("The NOAA server cannot be reached\n")
		} else {
			
			cat("Building bathy matrix ...\n")	
			as.bathy(bath) -> bath2
	
			if(keep==TRUE){
				write.table(bath, file=FILE, sep=",", quote=FALSE, row.names=FALSE)
			} # close if keep==TRUE statement
			return(bath2)
		}
	} # close else statement
}
