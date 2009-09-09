%  -*- TeX|UK -*- -*- Soft -*-
\name{SamplingPatternRandomSamplingUnits-class}
\docType{class}
\alias{SamplingPatternRandomSamplingUnits-class}

\title{Class "SamplingPatternRandomSamplingUnits"}

\description{A class for storing sampling units obtained by random sampling.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SamplingPatternRandomSamplingUnits", ...)}. However, objects are usually created by calling \code{\link{spsample}}.
}

\section{Slots}{
    \describe{
        \item{\code{sample}:}{Object of class \code{"\linkS4class{SpatialPoints}"}, containing the sampling locations.}
    }
}

\section{Extends}{
Class \code{"\linkS4class{SamplingPatternRandom}"}, directly.
Class \code{"\linkS4class{SamplingPattern}"}, by class "SamplingPatternRandom", distance 2.
}

\section{Methods}{
    \describe{
        \item{estimate}{\code{signature(statistic = "SamplingVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the sampling variance.  See \code{"\linkS4class{SamplingVariance}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialCumulativeDistributionFunction", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the spatial cumulative distribution function (SCDF).  See \code{"\linkS4class{SamplingPatternRandomSamplingUnits}"} for more details. }
        \item{estimate}{\code{signature(statistic = "SpatialMean", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the spatial mean.  See \code{"\linkS4class{SpatialMean}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialVariance", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the spatial variance.  See \code{"\linkS4class{SpatialVariance}"} for more details.}
        \item{estimate}{\code{signature(statistic = "StandardError", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates the standard error of the spatial mean. See \code{"\linkS4class{StandardError}"} for more details.}
        \item{estimate}{\code{signature(statistic = "character", stratification = "CompactStratification", samplingPattern = "SamplingPatternRandomSamplingUnits", data = "data.frame")}: estimates \code{statistic}, \emph{i.e.}, \code{"spatial mean"}, \code{"spatial variance"}, \code{"sampling variance"}, \code{"standard error"}, \code{SCDF}.}
    }
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
