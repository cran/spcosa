\name{spcosa-package}
\alias{spcosa}
\alias{spcosa-package}
\docType{package}

\title{
Spatial Coverage Sampling
}

\description{Algorithms for spatial coverage sampling and for random sampling from compact
geographical strata based on \emph{k}-means.}

\details{ The \pkg{spcosa}-package provides algorithms for spatial coverage sampling and for random sampling from compact geographical strata based on \emph{k}-means (see \cite{de Gruijter et al., 2006}, and \code{\link{kmeans}}). S4-classes and methods are available for spatial coverage sampling, random
sampling from compact geographical strata, and stratified simple random sampling for composites. In case of spatial coverage sampling, existing sampling points may be taken into account. See the package vignette (\file{./spcosa/doc/spcosa.pdf}) and the demos (\code{demo(package = "spcosa")}) for more information and examples. }

\author{
D.J.J. Walvoort, D.J. Brus, J.J. de Gruijter,

Maintainer: Dennis Walvoort \email{dennis.walvoort@wur.nl}
}

\references{
    Brus, D. J., Spatjens, L. E. E. M., and de Gruijter, J. J. (1999). A sampling scheme for estimating the mean extractable phosphorus concentration of fields for environmental regulation. Geoderma 89:129-148

    de Gruijter, J. J., Brus, D. J., Bierkens, M. F. P., and Knotters, M. (2006) \emph{Sampling for Natural Resource Monitoring} Berlin: Springer-Verlag.

}

\seealso{ \code{\link[=stratify-methods]{stratify}}, \code{\link{spsample}}, 
\code{\link[=estimate-methods]{estimate}} } 


\keyword{ package }

%\examples{
%~~ simple examples of the most important functions ~~
%}
