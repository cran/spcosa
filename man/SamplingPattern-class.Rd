%  -*- TeX|UK -*- -*- Soft -*-
\name{SamplingPattern-class}
\docType{class}
\alias{SamplingPattern-class}
\alias{coerce,SamplingPattern,data.frame-method}
\alias{coerce,SamplingPattern,SpatialPoints-method}
\alias{show,SamplingPattern-method}

\title{Class "SamplingPattern"}

\description{A class for storing a sampling pattern.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SamplingPattern", ...)}. However, objects are usually created by calling \code{\link{spsample}}.
}

\section{Slots}{
    \describe{
        \item{\code{sample}:}{Object of class \code{"\linkS4class{SpatialPoints}"}, containing the sampling locations.}
    }
}

\section{Methods}{
    \describe{
        \item{coerce}{\code{signature(from = "SamplingPattern", to = "data.frame")}: coerces to \code{"data.frame"}.}
        \item{coerce}{\code{signature(from = "SamplingPattern", to = "SpatialPoints")}: coerces to \code{"\linkS4class{SpatialPoints}"}.}
        \item{getSampleSize}{\code{signature(object = "SamplingPattern")}: returns the sample size.}
        \item{plot}{\code{signature(x = "CompactStratification", y = "SamplingPattern")}:  plots sampling pattern \code{y} on top of stratification \code{x}.}
        \item{plot}{\code{signature(x = "SamplingPattern", y = "missing")}: plots sampling pattern \code{x}.}
        \item{show}{\code{signature(object = "SamplingPattern")}: prints \code{object} on the output device.}
    }
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
