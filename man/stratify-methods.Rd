%  -*- TeX|UK -*- -*- Soft -*-
\name{stratify-methods}
\docType{methods}
\alias{stratify-methods}
\alias{stratify}
\alias{stratify,SpatialPixels-method}
\alias{stratify,SpatialGrid-method}
\alias{stratify,SpatialPolygons-method}

\title{Stratification}

\description{
Methods for partitioning a spatial object into compact strata by means of \eqn{$k$}{k}-means. The objective function to minimize is the mean squared shortest distance (MSSD). Optionally, the strata may be forced to be of equal size. This facilitates field work in case of stratified simple random sampling for composites. Another option is spatial infill sampling, a variant of spatial coverage sampling where existing sampling points are taken into account. Use \code{nTry > 1}, to reduce the risk of ending up in an unfavorable local optimum. Better results will generally be obtained by increasing the ratio \code{nGridCells/nStrata} and by increasing \code{nTry}.
}

\usage{
\S4method{stratify}{SpatialPixels}(object, nStrata, priorPoints = NULL, maxIterations = 1000, nTry = 1,
    equalArea = FALSE, verbose = getOption("verbose"))
\S4method{stratify}{SpatialGrid}(object, nStrata, priorPoints = NULL, maxIterations = 1000, nTry = 1,
    equalArea = FALSE, verbose = getOption("verbose"))
\S4method{stratify}{SpatialPolygons}(object, nStrata, priorPoints = NULL, maxIterations = 1000, nTry = 1,
    nGridCells = 2500, cellSize, equalArea = FALSE, verbose = getOption("verbose"))
}

\arguments{
\item{object}{an object of class \code{"\linkS4class{SpatialPixels}"}, \code{"\linkS4class{SpatialGrid}"} or \code{"\linkS4class{SpatialPolygons}"}}
\item{nStrata}{number of strata (\code{nStrata >= 1}).}
\item{priorPoints}{object of class \code{"\linkS4class{SpatialPoints}"}, containing the prior (i.e., existing) points}
\item{maxIterations}{maximum number of iterations.}
\item{nTry}{the \code{stratify} method will try \code{nTry} initial configurations and will keep the best solution in order to reduce the risk of ending up with an unfavorable solution.}
\item{nGridCells}{in case \code{object} is an instance of class \code{"\linkS4class{SpatialPolygons}"}, the approximate number of grid cells to be used for discretizing the vector map in \code{object}.}
\item{cellSize}{in case \code{object} is an instance of class \code{"\linkS4class{SpatialPolygons}"}, the cell size to be used for discretizing the vector map in \code{object}. Note that \code{cellsize} takes precedence over argument \code{nGridCells}.}
\item{equalArea}{If \code{FALSE} the algorithm results in compact strata. If \code{TRUE}, the algorithm results in compact strata of equal size.}
\item{verbose}{if \code{TRUE}, progress information and intermediate results will be printed to the output device.}
}

\section{Methods}{
\describe{

\item{object = "SpatialPixels"}{Stratify a raster representation of the study area.}

\item{object = "SpatialPolygons"}{Stratify a vector representation of the study area.}
}}


\note{
    The \code{stratify} method may raise an error when the projection attributes (\code{"\linkS4class{CRS}"}) have been set. A solution is to remove these attributes by calling the following function from the \pkg{sp}-package: \code{proj4string(myMap) <- NA_character_}, where \code{myMap} is the map to be stratified.
}

\references{
    Brus, D. J., Spatjens, L. E. E. M., and de Gruijter, J. J. (1999). A sampling scheme for estimating the mean extractable phosphorus concentration of fields for environmental regulation. Geoderma 89:129-148

    de Gruijter, J. J., Brus, D. J., Bierkens, M. F. P., and Knotters, M. (2006) \emph{Sampling for Natural Resource Monitoring} Berlin: Springer-Verlag.

    Walvoort, D., Brus, D. and de Gruijter, J. (2009). Spatial Coverage Sampling on Various Spatial Scales. Pedometron 26:20-22

    Walvoort, D. J. J., Brus, D. J. and de Gruijter, J. J. (2010). An R package for spatial coverage sampling and random sampling from compact geographical strata by \eqn{$k$}{k}-means. Computers & Geosciences 36: 1261-1267 (\doi{10.1016/j.cageo.2010.04.005})
}

\seealso{
    \code{\link{spsample}} for sampling, and \code{\link[=estimate-methods]{estimate}} for inference.
}



\examples{
# Note: the example below requires the 'rgdal'-package
# You may consider the 'maptools'-package as an alternative
if (require(rgdal)) {

    # read a vector representation of the `Farmsum' field
    shpFarmsum <- readOGR(
        dsn = system.file("maps", package = "spcosa"),
        layer = "farmsum"
    )

    # stratify `Farmsum' into 50 strata
    # NB: increase argument 'nTry' to get better results
    set.seed(314)
    myStratification <- stratify(shpFarmsum, nStrata = 50, nTry = 1)

    # plot the resulting stratification
    plot(myStratification)

}
}

\keyword{methods}
