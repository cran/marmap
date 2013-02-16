as.bathy <- function(xyz){

### xyz: three-column data.frame with longitude (x), latitude (y) and depth (z) (no default)
### header: whether this table has a row of column names (default = FALSE)

	bath <- na.omit(xyz)
	bath <- bath[order(bath[,2],bath[,1], decreasing=FALSE),]

	unique(bath[,2]) -> lat
	unique(bath[,1]) -> lon
	
	length(lon) -> brow
	length(lat) -> bcol

	matrix(bath[,3], nrow=brow, ncol=bcol, byrow=FALSE, dimnames= list(lon,lat)) -> mat
	
	check.bathy(mat) -> ordered.mat
	class(ordered.mat) <- "bathy"
	return(ordered.mat)
	
}
