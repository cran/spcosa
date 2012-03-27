%  -*- TeX|UK -*- -*- Soft -*-
\name{CompactStratificationEqualArea-class}
\docType{class}
\alias{CompactStratificationEqualArea-class}

\title{Class "CompactStratificationEqualArea"}

\description{A class for storing a stratification with compact strata of equal size.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("CompactStratificationEqualArea", cells, stratumId, centroids, mssd)}. However, objects are usually created by calling \code{\link[=stratify-methods]{stratify}}.
}

\section{Slots}{
    \describe{
        \item{\code{cells}:}{Object of class \code{"\linkS4class{SpatialPixels}"}, representing the area to be partitioned.}
        \item{\code{stratumId}:}{Object of class \code{"integer"}, indicating to which stratum each cell in \code{cells} belong.}
        \item{\code{centroids}:}{Object of class \code{"\linkS4class{SpatialPoints}"}, representing the centers of gravity of each stratum.}
        \item{\code{mssd}:}{Object of class \code{"numeric"}, representing the mean squared shortest distance.}
    }
}

\section{Extends}{
    Class \code{"\linkS4class{CompactStratification}"}, directly.
    Class \code{"\linkS4class{Stratification}"}, by class "CompactStratification", distance 2.
}

\section{Methods}{
    \describe{
        \item{estimate}{\code{signature(statistic = "SamplingVariance", stratification = "CompactStratificationEqualArea", samplingPattern = "SamplingPatternRandomComposite", data = "data.frame")}: estimates the sampling variance.  See \code{"\linkS4class{SamplingVariance}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialMean", stratification = "CompactStratificationEqualArea", samplingPattern = "SamplingPatternRandomComposite", data = "data.frame")}: estimates the spatial mean.  See \code{"\linkS4class{SpatialMean}"} for more details. }
        \item{spsample}{\code{signature(x = "CompactStratificationEqualArea", n = "missing", type = "missing")}: returns the centers of gravity of each stratum.}
        \item{spsample}{\code{signature(x = "CompactStratificationEqualArea", n = "numeric", type = "missing")}: randomly selects \code{n} sampling points in each stratum.}
        \item{spsample}{\code{signature(x = "CompactStratificationEqualArea", n = "numeric", type = "character")}: randomly selects \code{n} sampling points in each stratum. if \code{type = "composite"}, stratified simple random sampling of \eqn{n} composites.}
    }
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}