%  -*- TeX|UK -*- -*- Soft -*-
\name{SamplingPatternRandomComposite-class}
\docType{class}
\alias{SamplingPatternRandomComposite-class}
\alias{coerce,SamplingPatternRandomComposite,data.frame-method}
\alias{coerce,SamplingPatternRandomComposite,SpatialPointsDataFrame-method}

\title{Class "SamplingPatternRandomComposite"}

\description{A class for storing composites obtained by random sampling.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SamplingPatternRandomComposite", ...)}. However, objects are usually created by calling \code{\link{spsample}}.
}

\section{Slots}{
    \describe{
        \item{\code{composite}:}{Object of class \code{"integer"}, indicating to which composite sample a sampling unit belongs.}
        \item{\code{sample}:}{Object of class \code{"\linkS4class{SpatialPoints}"}, containing the sampling locations.}
    }
}


\section{Extends}{
Class \code{"\linkS4class{SamplingPatternRandom}"}, directly.
Class \code{"\linkS4class{SamplingPattern}"}, by class "SamplingPatternRandom", distance 2.
}

\section{Methods}{
    \describe{
        \item{coerce}{\code{signature(from = "SamplingPatternRandomComposite", to = "data.frame")}: coerces to \code{"data.frame"}.}
        \item{coerce}{\code{signature(from = "SamplingPatternRandomComposite", to = "SpatialPointsDataFrame")}: coerces to \code{"\linkS4class{SpatialPointsDataFrame}"}.}
        \item{estimate}{\code{signature(statistic = "SamplingVariance", stratification = "CompactStratificationEqualArea", samplingPattern = "SamplingPatternRandomComposite", data = "data.frame")}:  estimates the sampling variance.  See \code{"\linkS4class{SamplingVariance}"} for more details.}
        \item{estimate}{\code{signature(statistic = "SpatialMean", stratification = "CompactStratificationEqualArea", samplingPattern = "SamplingPatternRandomComposite", data = "data.frame")}: estimates the spatial mean. See \code{"\linkS4class{SpatialMean}"} for more details.}
        \item{getSampleSize}{\code{signature(object = "SamplingPatternRandomComposite")}: returns the sample size per stratum.}
        \item{plot}{\code{signature(x = "CompactStratification", y = "SamplingPatternRandomComposite")}:  plots sampling pattern \code{y} on top of stratification \code{x}.}
        \item{plot}{\code{signature(x = "SamplingPatternRandomComposite", y = "missing")}:  plots sampling pattern \code{x}.}
    }
}


\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
