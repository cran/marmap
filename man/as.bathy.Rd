\name{as.bathy}
\alias{as.bathy}
\title{
Convert to bathymetric data in an object of class bathy}
\description{
Reads a three-column data.frame containing longitude (x), latitude (y) and depth (z) data and converts it to a matrix of class bathy. 
}
\usage{
as.bathy(xyz)
}
\arguments{
  \item{xyz}{
three-column data.frame with longitude (x), latitude (y) and depth (z) (no default)
}
}
\details{
Idealy, \code{xyz} contains data downloaded from the NOAA GEODAS Grid Translator webpage (http://www.ngdc.noaa.gov/mgg/gdas/gd_designagrid.html).
}
\value{
The output of \code{as.bathy} is a matrix of class \code{bathy}, which dimensions depends on the resolution of the grid uploaded from the NOAA GEODAS server (Grid Cell Size). The class \code{bathy} has its own methods for summarizing and ploting the data.
}
\author{
Benoit Simon-Bouhet
}
\seealso{
\code{\link{summary.bathy}}, \code{\link{plot.bathy}}, \code{\link{read.bathy}}
}
\examples{
# load NW Atlantic data
data(nw.atlantic)

# use as.bathy
atl <- as.bathy(nw.atlantic)

# class "bathy"
class(atl)

# summarize data of class "bathy"
summary(atl)

}
