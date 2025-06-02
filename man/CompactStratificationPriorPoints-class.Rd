%  -*- TeX|UK -*- -*- Soft -*-
\name{CompactStratificationPriorPoints-class}
\docType{class}
\alias{CompactStratificationPriorPoints-class}

\title{Class "CompactStratificationPriorPoints"}

\description{A class for storing a stratification with compact strata, given prior sampling locations.}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("CompactStratificationPriorPoints", cells, stratumId, centroids, mssd, priorPoints)}. However, objects are usually created by calling \code{\link[=stratify-methods]{stratify}}.
}

\section{Slots}{
     \describe{
    \item{\code{priorPoints}:}{Object of class \code{"\link[sp:SpatialPoints]{sp::SpatialPoints}"}, containing the coordinates of the existing locations.}
    \item{\code{cells}:}{Object of class \code{"\link[sp:SpatialPixels]{sp::SpatialPixels}"}, representing the area to be partitioned.}
    \item{\code{stratumId}:}{Object of class \code{"integer"}, indicating to which stratum each cell in \code{cells} belong.}
    \item{\code{centroids}:}{Object of class\code{"\link[sp:SpatialPoints]{sp::SpatialPoints}"}, representing the centers of gravity of each stratum.}
    \item{\code{mssd}:}{Object of class \code{"numeric"}, representing the mean squared shortest distance.}
  }
}



\section{Extends}{
Class \code{"\linkS4class{CompactStratification}"}, directly.
Class \code{"\linkS4class{Stratification}"}, by class "CompactStratification", distance 2.
}

\section{Methods}{
  \describe{
    \item{spsample}{\code{signature(x = "CompactStratificationPriorPoints", n = "missing", type = "missing")}: returns the centers of gravity of strata \emph{without} prior points in addition to the prior points.}
     }
}

\author{Dennis J. J. Walvoort \email{dennis.walvoort@wur.nl}, D.J. Brus, J.J. de Gruijter}

\keyword{classes}
