\name{coef.fd}
\alias{coef.fd}
\alias{coef.fdPar}
\alias{coef.fdSmooth}
\alias{coef.Taylor}
\alias{coefficients.fd}
\alias{coefficients.fdPar}
\alias{coefficients.fdSmooth}
\alias{coefficients.Taylor}
\title{
  Extract functional coefficients 
}
\description{
  Obtain the coefficients component from a functional object (functional
  data, class \code{fd}, functional parameter, class \code{fdPar}, a
  functional smooth, class \code{fdSmooth}, or a Taylor spline
  representation, class \code{Taylor}.  
}
\usage{
\method{coef}{fd}(object, ...)
\method{coef}{fdPar}(object, ...)
\method{coef}{fdSmooth}(object, ...)
\method{coef}{Taylor}(object, ...)
\method{coefficients}{fd}(object, ...)
\method{coefficients}{fdPar}(object, ...)
\method{coefficients}{fdSmooth}(object, ...)
\method{coefficients}{Taylor}(object, ...)
}
\arguments{
  \item{object}{
    An object whose functional coefficients are desired 
  }
  \item{\dots }{
    other arguments 
  }
}
\details{
  Functional representations are evaluated by multiplying a basis
  function matrix times a coefficient vector, matrix or 3-dimensional
  array. (The basis function matrix contains the basis functions as
  columns evaluated at the \code{evalarg} values as rows.)  
}
\value{
  A numeric vector or array of the coefficients.  
}
\seealso{
  \code{\link[stats]{coef}}
  \code{\link{fd}}
  \code{\link{fdPar}}
  \code{\link{smooth.basisPar}}
  \code{\link{smooth.basis}}
%  \code{\link{Taylor}} 
}
\examples{
##
## coef.fd
##
bspl1.1 <- create.bspline.basis(norder=1, breaks=0:1)
fd.bspl1.1 <- fd(0, basisobj=bspl1.1)
coef(fd.bspl1.1)
\dontshow{
stopifnot(all.equal(coef(fd.bspl1.1), coefficients(fd.bspl1.1)))
}

##
## coef.fdPar 
##
rangeval <- c(-3,3)
#  set up some standard normal data
x <- rnorm(50)
#  make sure values within the range
x[x < -3] <- -2.99
x[x >  3] <-  2.99
#  set up basis for W(x)
basisobj <- create.bspline.basis(rangeval, 11)
#  set up initial value for Wfdobj
Wfd0 <- fd(matrix(0,11,1), basisobj)
WfdParobj <- fdPar(Wfd0)

coef(WfdParobj)
\dontshow{
stopifnot(all.equal(coef(WfdParobj), coefficients(WfdParobj)))
}

##
## coef.fdSmooth
##

girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf))
coef(girlGrowthSm)
\dontshow{stopifnot(
all.equal(coef(girlGrowthSm), coefficients(girlGrowthSm)) 
)}

##
## coef.Taylor 
##
# coming soon.

}
\keyword{utilities}
