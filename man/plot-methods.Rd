%  -*- TeX|UK -*- -*- Soft -*-
\name{plot-methods}
\docType{methods}
%\alias{plot-methods}
%\alias{plot,ANY,ANY-method}
\alias{plot,CompactStratification,missing-method}
\alias{plot,CompactStratification,SamplingPattern-method}
\alias{plot,CompactStratification,SamplingPatternPriorPoints-method}
\alias{plot,CompactStratification,SamplingPatternRandomComposite-method}
\alias{plot,SamplingPattern,missing-method}
\alias{plot,SamplingPatternPriorPoints,missing-method}
\alias{plot,SamplingPatternRandomComposite,missing-method}

\title{Visualizing Compact Stratifications and Sampling Patterns}

\description{
The \code{plot} method can be used to visualize compact stratifications and sampling patterns. Since it has
been built on top of the \pkg{ggplot2} package, functions provided by this package can be used to
modify the plots.
}

\section{Methods}{ \describe{

\item{x = "CompactStratification", y = "missing"}{plots stratification \code{x}.}

\item{x = "CompactStratification", y = "SamplingPattern"}{plots sampling pattern \code{y} on top of stratification \code{x}.}

\item{x = "CompactStratification", y = "SamplingPatternPriorPoints"}{plots sampling pattern \code{y} on top of stratification \code{x}.}

\item{x = "CompactStratification", y = "SamplingPatternRandomComposite"}{plots sampling pattern \code{y} on top of stratification \code{x}.}

\item{x = "SamplingPattern", y = "missing"}{plots sampling pattern \code{x}.}

\item{x = "SamplingPatternPriorPoints", y = "missing"}{plots sampling pattern \code{x}.}

\item{x = "SamplingPatternRandomComposite", y = "missing"}{plots sampling pattern \code{x}.}
}}

\seealso{\pkg{ggplot2}-package}


\keyword{methods}
