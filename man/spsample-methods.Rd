%  -*- TeX|UK -*- -*- Soft -*-
\name{spsample-methods}
\docType{methods}
\alias{spsample}
\alias{spsample,CompactStratification,missing,missing-method}
\alias{spsample,CompactStratification,numeric,missing-method}
\alias{spsample,CompactStratificationEqualArea,numeric,character-method}
\alias{spsample,CompactStratificationPriorPoints,missing,missing-method}

\title{Spatial Sampling of Compact Strata}

\description{
    Methods for sampling in compact strata.
}
\section{Methods}{
\describe{

\item{x = "CompactStratification", n = "missing", type = "missing"}{samples the centroids of each stratum.}

\item{x = "CompactStratification", n = "numeric", type = "missing"}{stratified simple random sampling with \eqn{n} samples per stratum.}

\item{x = "CompactStratificationEqualArea", n = "numeric", type = "character"}{if \code{type = "composite"}, stratified simple random sampling of \eqn{n} composites.}

\item{x = "CompactStratificationPriorPoints", n = "missing", type = "missing"}{spatial infill sampling}

}}

\seealso{
    \code{\link[=stratify-methods]{stratify}} for stratification, \code{\link[sp]{spsample}} for other types of spatial sampling, and \code{\link[=estimate-methods]{estimate}} for inference.
}


\examples{
# Note: the example below requires the 'rgdal'-package.
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

    # sample two sampling units per stratum
    mySamplingPattern <- spsample(myStratification, n = 2)

    # plot the resulting sampling pattern on
    # top of the stratification
    plot(myStratification, mySamplingPattern)

}
}


\keyword{methods}
