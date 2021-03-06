\name{knots.fd}
\alias{knots.fd}
\alias{knots.fdSmooth}
\alias{knots.basisfd}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract the knots from a function basis or data object}
\description{
  Extract either all or only the interior knots from an object of class
  \code{basisfd}, \code{fd}, or \code{fdSmooth}.  
}
\usage{
\method{knots}{fd}(Fn, interior=TRUE, ...)
\method{knots}{fdSmooth}(Fn, interior=TRUE, ...)
\method{knots}{basisfd}(Fn, interior=TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Fn}{
    an object of class \code{basisfd} or containing such an object 
  }
  \item{interior}{
    logical:

    if TRUE, the first Fn[["k"]]+1 of Fn[["knots"]] are dropped, and the
    next Fn[["g"]] are returned.

    Otherwise, the first Fn[["n"]] of Fn[["knots"]] are returned.  
  }
  \item{\dots}{ignored} 
}
\details{
  The interior knots of a \code{bspline} basis are stored in the
  \code{params} component.  The remaining knots are in the
  \code{rangeval} component, with mulltiplicity norder(Fn).  
}
\value{
  Numeric vector.  If 'interior' is TRUE, this is the \code{params}
  component of the \code{bspline} basis.  Otherwise, \code{params} is
  bracketed by rep(rangeval, norder(basisfd).  
}
\references{  
  Dierckx, P. (1991) \emph{Curve and Surface Fitting with Splines},
  Oxford Science Publications.

  
}
\author{Spencer Graves }
\seealso{
  \code{\link{fd}},
  \code{\link{create.bspline.basis}},
  \code{\link[DierckxSpline]{knots.dierckx}}
}
\examples{
x <- 0:24
y <- c(1.0,1.0,1.4,1.1,1.0,1.0,4.0,9.0,13.0,
       13.4,12.8,13.1,13.0,14.0,13.0,13.5,
       10.0,2.0,3.0,2.5,2.5,2.5,3.0,4.0,3.5)
if(require(DierckxSpline)){
   z1 <- curfit(x, y, method = "ss", s = 0, k = 3)
   knots1 <- knots(z1)
   knots1All <- knots(z1, interior=FALSE) # to see all knots
#
   fda1 <- dierckx2fd(z1)
   fdaKnots <- knots(fda1)
   fdaKnotsA <- knots(fda1, interior=FALSE)
   stopifnot(all.equal(knots1, fdaKnots))
   stopifnot(all.equal(knots1All, fdaKnotsA))
}

# knots.fdSmooth 
girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf))

girlKnots.fdSm <- knots(girlGrowthSm) 
girlKnots.fdSmA <- knots(girlGrowthSm, interior=FALSE)
stopifnot(all.equal(girlKnots.fdSm, girlKnots.fdSmA[5:33]))

girlKnots.fd <- knots(girlGrowthSm$fd) 
girlKnots.fdA <- knots(girlGrowthSm$fd, interior=FALSE)

stopifnot(all.equal(girlKnots.fdSm, girlKnots.fd))
stopifnot(all.equal(girlKnots.fdSmA, girlKnots.fdA))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{smooth}
\keyword{optimize}
