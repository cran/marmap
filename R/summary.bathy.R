summary.bathy = function(object, ...){
	
	round(min(as.numeric(colnames(object))),2) -> lat.min
	round(max(as.numeric(colnames(object))),2) -> lat.max
	round(min(as.numeric(rownames(object))),2) -> lon.min
	round(max(as.numeric(rownames(object))),2) -> lon.max
	
	one.minute = 0.016667
	as.numeric(rownames(object))[2] - as.numeric(rownames(object))[1] -> cell.size.centroid
	round(cell.size.centroid / one.minute, 1) -> cell.size.minute
	
	cat(paste("Bathymetric data of class 'bathy', with",dim(object)[1],"rows and",dim(object)[2],"columns\n"))
	cat(paste("Latitudinal range:", lat.min,"to", lat.max, "\n"))
	cat(paste("Longitudinal range:", lon.min,"to", lon.max, "\n"))
	cat(paste("Cell size:",cell.size.minute,"minute(s)\n"))
	cat("\n")
	cat("Depth statistics:\n")
	print(summary(as.vector(object), ...))
	cat("\n")
	cat("First 5 columns and rows of the bathymetric matrix:\n")
	object[1:5, 1:5]
}