\name{read.bathy}
\alias{read.bathy}
\title{
Read bathymetric data in XYZ format
}
\description{
Reads a three-column table containing longitude (x), latitude (y) and depth (z) data.
}
\usage{
read.bathy(xyz, header = FALSE, sep = ",", ...)
}
\arguments{
  \item{xyz}{
three-column table with longitude (x), latitude (y) and depth (z) (no default)
}
  \item{header}{
whether this table has a row of column names (default = FALSE)
}
  \item{sep}{
character separating columns, (default=",")
}
  \item{...}{
further arguments to be passed to \code{read.table()}
}
}
\value{
The output of \code{read.bathy} is a matrix of class \code{bathy}, which dimensions depends on the resolution of the grid uploaded from the NOAA GEODAS server (Grid Cell Size). The class \code{bathy} has its own methods for summarizing and ploting the data.
}
\author{
Eric Pante
}
\seealso{
\code{\link{summary.bathy}}, \code{\link{plot.bathy}}, \code{\link{readGEBCO.bathy}}
}
\examples{
# load NW Atlantic data
data(nw.atlantic)

# write example file to disk
write.table(nw.atlantic, "NW_Atlantic.csv", sep=",", quote=FALSE, row.names=FALSE)

# use read.bathy
read.bathy("NW_Atlantic.csv", header=TRUE) -> atl

# remove temporary file
system("rm NW_Atlantic.csv") # remove file, for unix-like systems

# class "bathy"
class(atl)

# summarize data of class "bathy"
summary(atl)

}
