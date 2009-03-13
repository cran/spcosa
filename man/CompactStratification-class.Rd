%  -*- TeX|UK -*- -*- Soft -*-
\name{CompactStratification-class}
\docType{class}
\alias{CompactStratification-class}
\alias{coerce,CompactStratification,data.frame-method}
\alias{coerce,CompactStratification,SpatialPixels-method}
\alias{coerce,CompactStratification,SpatialPixelsDataFrame-method}

\title{Class "CompactStratification"}

\description{A class for storing a stratification with compact strata.}

\section{Objects from the Class}{ Objects can be created by calls of the form
\code{new("CompactStratification", cells, stratumId, centroids, mssd)}. However, objects are usually
created by calling \code{\link[=stratify-methods]{stratify}}. }

\section{Slots}{
    \describe{
        \item{\code{cells}:}{Object of class \code{"\link[sp]{SpatialPixels}"}, representing the area to be partitioned.}
        \item{\code{stratumId}:}{Object of class \code{"integer"}, indicating to which stratum each cell in \code{cells} belong.}
        \item{\code{centroids}:}{Object of class \code{"\link[sp]{SpatialPoints}"}, representing the centers of gravity of each stratum.}
        \item{\code{mssd}:}{Object of class \code{"numeric"}, representing the mean squared shortest distance.}
    }
}

\section{Extends}{
Class \code{"\linkS4class{Stratification}"}, directly.
}

\section{Methods}{
    \describe{
        \item{coerce}{\code{signature(from = "CompactStratification", to = "data.frame")}: coerces to \code{"\link{data.frame}"}.}
        \item{coerce}{\code{signature(from = "CompactStratification", to = "SpatialPixels")}: coerces to \code{"\link[sp]{SpatialPixels}"}.}
        \item{coerce}{\code{signature(from = "CompactStratification", to = "SpatialPixelsDataFrame")}: coerces to \code{"\link[sp]{SpatialPixelsDataFrame}"}.}
        \item{estimate}{\code{signature(statistic = "SamplingVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the sampling variance.  See  \code{"\linkS4class{SamplingVariance}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialCumulativeDistributionFunction", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the spatial cumulative distribution function (SCDF).  See  \code{"\linkS4class{SpatialCumulativeDistributionFunction}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialMean", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the spatial mean.  See  \code{"\linkS4class{SpatialMean}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the spatial variance. See  \code{"\linkS4class{SpatialVariance}"} for more details.}
        \item{estimate}{\code{signature(statistic = "StandardError", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the standard error of the spatial mean. See \code{"\linkS4class{StandardError}"} for more details.}
        \item{estimate}{\code{signature(statistic = "character", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates \code{statistic}, one of \code{spatial mean}, \code{spatial variance}, \code{SCDF}, \code{sampling variance}, or \code{standard error}.}
        \item{getArea}{\code{signature(object = "CompactStratification")}: returns the area of each stratum.}
        \item{getCentroid}{\code{signature(object = "CompactStratification")}: returns the center of gravity of each stratum.}
        \item{getNumberOfStrata}{\code{signature(object = "CompactStratification")}: returns the number of strata.}
        \item{getObjectiveFunctionValue}{\code{signature(object = "CompactStratification")}: extracts the mean squared shortest distance.}
        \item{getRelativeArea}{\code{signature(object = "CompactStratification")}: returns the relative area of each stratum. The sum of the relative areas equals one.}
        \item{plot}{\code{signature(x = "CompactStratification", y = "missing")}: plots stratification \code{x}.}
        \item{plot}{\code{signature(x = "CompactStratification", y = "SamplingPattern")}: plots sampling pattern \code{y} on top of stratification \code{x}.}
        \item{plot}{\code{signature(x = "CompactStratification", y = "SamplingPatternPriorPoints")}: plots sampling pattern \code{y} on top of stratification \code{x}.}
        \item{plot}{\code{signature(x = "CompactStratification", y = "SamplingPatternRandomComposite")}: plots sampling pattern \code{y} on top of stratification \code{x}.}
        \item{spsample}{\code{signature(x = "CompactStratification", n = "missing", type = "missing")}: returns the centers of gravity of each stratum.}
        \item{spsample}{\code{signature(x = "CompactStratification", n = "numeric", type = "missing")}: randomly selects \code{n} sampling points in each stratum.}
    }
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
