lc.dist <- function(trans,loc,res=c("dist","path")) {
	
	require(gdistance)
	
	if (res=="dist") {
		cost <- costDistance(trans,as.matrix(loc))/1000
		return(round(cost))
	}
	
	if (res=="path") {
		nb.loc <- nrow(loc)
		path <- list()
		comb <- combn(1:nb.loc,2)
		pb <- txtProgressBar(min = 0, max = ncol(comb), style = 3)

		for (i in 1:ncol(comb)) {
			origin <- SpatialPoints(loc[comb[1,i],])
			goal <- SpatialPoints(loc[comb[2,i],])
			
			temp <- shortestPath(trans,origin,goal,output="SpatialLines")
			path[[i]] <- temp@lines[[1]]@Lines[[1]]@coords
			
			setTxtProgressBar(pb, i)
		}

	close(pb)
	return(path)
	}
	
}