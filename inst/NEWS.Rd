\name{NEWS}

\title{News for Package \pkg{'spcosa'}}

\section{Changes in version 0.4-4 (2025-06-29)}{
  \itemize{
    \item Made sure that all 'CRAN-checks' are passed.
  }
}

\section{Changes in version 0.4-3 (2025-06-02)}{
  \itemize{
    \item removed escaped LaTeX specials in NEWS.Rd as indicated by 'CRAN checks'
    \item added package anchors for all Rd link-targets as indicated by 'CRAN checks'
  }
}

\section{Changes in version 0.4-2 (2023-04-11)}{
  \itemize{
    \item removed dependence on rgdal (Roger Bivand, 2023-04-10)
    \item updated CITATION file to new format (Uwe Ligges, 2023-04-11)
  }
}

\section{Changes in version 0.4-1 (2022-08-11)}{
  \itemize{
    \item fixed Rd-files to prevent rendering problems in the HTML version of the documentation (Kurt Hornik & Deepayan Sarkar, 2022-08-11)
  }
}

\section{Changes in version 0.4-0 (2021-12-09)}{
  \itemize{
    \item \code{stratifiy} no longer internally reprojects maps to latlon. It is
        now up to the user to supply a proper map projection. If the map has
        EPSG:4326, then great circle distances are used. In all other cases
        \pkg{spcosa} uses Euclidean distances for stratification.
    \item prevented spurious errors by \code{proj4string} as suggested by
        the \pkg{sp}-package authors in their vignette (CRS_warnings).
  }
}

\section{Changes in version 0.3-11 (2021-01-12)}{
  \itemize{
    \item added PROJ (>= 6) to SystemRequirements in the DESCRIPTION file (Uwe Ligges, 2021-01-18)
    \item removed dependency from rgl and gstat by simplifying vignette
    \item added package versions to DESCRIPTION file to remove notes/warnings from CRAN
  }
}

\section{Changes in version 0.3-10 (2021-01-06)}{
  \itemize{
    \item added doi-tag to Rd-files
    \item corrected outdated hyper links in the manual
    \item changed http to https
    \item updated rgl code
    \item made suggested package rgl conditional, as suggested by Ripley (2020-12-08) 
  }
}

\section{Changes in version 0.3-9 (2020-01-13)}{
  \itemize{
    \item made code compatible with coming R version 4.0.0 following directions CRAN
  }
}

\section{Changes in version 0.3-8 (2018-03-30)}{
  \itemize{
    \item changed runtime check for Java version as suggested by Ripley (2018-03-28 12:22)
  }
}

\section{Changes in version 0.3-7 (2018-01-19)}{
  \itemize{
    \item changed Java version format as suggested by Ripley (2018-01-07 10:55)
    \item added runtime check for Java version
  }
}

\section{Changes in version 0.3-6 (2015-12-19)}{
  \itemize{
    \item package vignette converted to R-markdown
    \item minor changes to make \pkg{spcosa} compatible with \pkg{ggplot2} version 2.0.0
  }
}


\section{Changes in version 0.3-5 (2013-05-01)}{
  \itemize{
    \item modifications in version 0.3-4 only worked for 'geometry' objects (SpatialPixels etc.) and not for their Spatial*DataFrames counterparts. This issue has now been solved.
  }
}

\section{Changes in version 0.3-4 (2013-04-29)}{
  \itemize{
    \item replaced deprecated method \code{sp:::overlay} by \code{sp:::\%over\%} (issue reported by Edzer Pebesma)
  }
}



\section{Changes in version 0.3-3 (2013-01-30)}{
  \itemize{
    \item moved start-up message from \code{.onLoad} to \code{.onAttach} to prevent 'R CMD check' from printing a NOTE in "R Under development (unstable) (2013-01-25 r61745)" 
    \item Some minor modifications to the package vignette
  }
}


\section{Changes in version 0.3-2 (2012-12-05)}{
  \itemize{
    \item reorganization of files to make file names portable (required by R-devel, issue reported by Brian D. Ripley, 2012-12-04 17:53)
  }
}

\section{Changes in version 0.3-1 (2012-09-11)}{
  \itemize{
    \item corrected some typos
    \item upgraded to \pkg{ggplot2} version 0.9.2
  }
}



\section{Changes in version 0.3-0 (2012-03-27)}{
    \itemize{
        \item replaced ./NEWS by ./inst/NEWS.Rd
        \item \code{stratify} method with signature \code{SpatialPolygons} has gained a new argument: \code{cellSize}. Argument \code{cellSize} takes precedence over argument \code{nGridCells}.
        \item upgraded to \pkg{ggplot2} 0.9.0
        \item upgraded to \pkg{sp} 0.9-97
        \item added \code{stratify} method for instances of class \code{SpatialGrid} (due to recent changes in package \pkg{sp})
        \item dependency on package \pkg{rgdal} has been reduced. \pkg{spcosa} now only requires package \pkg{rgdal} in case projection attributes have been set. \pkg{spcosa} will therefore also run on systems without 'gdal'.
        \item packages like \pkg{sp} and \pkg{rgdal} need to be loaded explicitly. In previous versions of \pkg{spcosa} these packages were automatically loaded.
        \item documentation and vignette have been updated
        \item minor changes to the code to pass all checks (without warnings) in R 2.15.0
    }
}

\section{Changes in version 0.2-3 (2010-10-08)}{
  \itemize{
    \item updated documentation
    \item added new demo (\file{sphere2.R})
  }
}

\section{Changes in version 0.2-2 (2010-07-28)}{
  \itemize{
    \item changed code of plot-methods to prevent 'NOTES' generated by
      \code{R CMD check}: "no visible binding for global variable ..."
    \item added doi of paper in Computer & Geosciences to citation file
    \item added FAQ
  }
}

\section{Changes in version 0.2-1 (2010-04-19)}{
  \itemize{
    \item dynamic HTML added to \pkg{spcosa}-package.Rd
    \item updated references in Rd-files and CITATION file
    \item package vignette has been updated
  }
}

\section{Changes in version 0.2-0 (2009-11-11)}{
  \itemize{
    \item added a line (at start-up and in the package-file) that a
      recent version of Java is required in order to run \pkg{spcosa}.
    \item upgraded to \R 2.10-0 and \pkg{rJava} 0.8-1. Previous releases of
      \pkg{spcosa} are not compatible with the new \pkg{rJava} 0.8-series
  }
}

\section{Changes in version 0.1-5 (2009-09-08)}{
  \itemize{
    \item fixed 'suspect' hyperlink issue reported by \code{'R CMD check'} of
      '\R version 2.10.0 Under development (unstable) (2009-09-07 r49613)'
    \item added more contrast to spatial strata plots
  }
}

\section{Changes in version 0.1-4 (2009-06-29)}{
  \itemize{
    \item minor bug fixed in method \code{'getArea'}. In previous versions of \pkg{spcosa},
      the area was returned in units of grid cells i.s.o. map units.
      Since \pkg{spcosa} relies on relative areas, this bug did _not_ affect
      other methods in the package.
    \item visualization of class hierarchies in the package vignette by means
      of the new \code{'classesToAM'} function
    \item minor update of documentation (Rd files)
    \item warnings due to coercion to class \code{"SpatialPixelsDataFrame"} have been
      suppressed.
    \item dependency has been increased from  \R (>= 2.8.0) to \R (>= 2.9.0).
      Otherwise \pkg{ggplot2}-functions might fail.
  }
}

\section{Changes in version 0.1-3 (2009-05-16)}{
  \itemize{
    \item citation file has been updated
    \item minor improvements of source code
  }
}

\section{Changes in version 0.1-2 (2009-03-23)}{
  \itemize{
    \item fixed a minor bug in the plot method with signature
      \code{"SamplingPatternPriorPoints"}
    \item minor update of package vignette
  }
}

\section{Changes in version 0.1-1 (2009-03-13)}{
  \itemize{
    \item documentation has been made compatible with "\R version 2.9.0 Under
      development (unstable) (2009-03-08 r48082)"
  }
}

\section{Changes in version 0.1-0 (2009-03-12)}{
  \itemize{
    \item first release
  }
}
