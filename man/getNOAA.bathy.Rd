\name{getNOAA.bathy}
\alias{getNOAA.bathy}
\title{
Import bathymetric data from the NOAA server}
\description{
Imports bathymetric data from the NOAA server, given coordinate bounds and resolution. 
}
\usage{
getNOAA.bathy(lon1,lon2,lat1,lat2, resolution = 4)
}
\arguments{
  \item{lon1}{
first longitude of the area for which bathymetric data will be downloaded 
}
  \item{lon2}{
second longitude of the area for which bathymetric data will be downloaded 
}
  \item{lat1}{
first latitude of the area for which bathymetric data will be downloaded 
}
  \item{lat2}{
second latitude of the area for which bathymetric data will be downloaded 
}
  \item{resolution}{
resolution of the grid, in minutes (default is 4)
}
}
\details{
\code{getNOAA.bathy} queries the ETOPO1 database hosted on the NOAA website, given the coordinates of the area of interest and desired resolution.  
}
\value{
The output of \code{getNOAA.bathy} is a matrix of class \code{bathy}, which dimensions depends on the resolution of the grid uploaded from the NOAA server. The class \code{bathy} has its own methods for summarizing and ploting the data. 
}
\references{
Amante, C. and B. W. Eakins, ETOPO1 1 Arc-Minute Global Relief Model: Procedures, Data Sources and Analysis. NOAA Technical Memorandum NESDIS NGDC-24, 19 pp, March 2009. \url{http://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/docs/ETOPO1.pdf}
}
\author{
Eric Pante
}
\seealso{
\code{\link{read.bathy}}, \code{\link{plot.bathy}}
}
\examples{
# you must have an internet connection. This line queries the NOAA ETOPO1 database 
# for data from North Atlantic, for a resolution of 10 minutes. 

getNOAA.bathy(lon1=-20,lon2=-90,lat1=50,lat2=20, resolution=10) -> a
plot(a, image=TRUE, deep=-6000, shallow=0, step=1000)

# download speed for a matrix of 10 degrees x 10 degrees x 30 minutes
system.time(getNOAA.bathy(lon1=0,lon2=10,lat1=0,lat2=10, resolution=30))
}
