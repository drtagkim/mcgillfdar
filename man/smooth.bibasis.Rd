\name{smooth.bibasis}
\alias{smooth.bibasis}
\title{
  Smooth a discrete surface over a rectangular lattice
}
\description{
  Estimate a smoothing function f(s, t) over a rectangular lattice
}
\usage{
smooth.bibasis(sarg, targ, y, fdPars, fdPart,
             fdnames=NULL)
}
\arguments{
  \item{sarg, targ}{
    vectors of argument values for the first and second dimensions,
    respectively, of the surface function.
  }
  \item{y}{
    an array containing surface values measured with noise
  }
  \item{fdPars, fdPart}{
    functional parameter objects for \code{sarg} and \code{targ},
    respectively
  }
  \item{fdnames}{
    a list of length 3 containing character vectors of names for
    \code{sarg}, \code{targ}, and the surface function f(s, t).
  }
}
%\details{}
\value{
  a list with the following components:

  \item{fdobj}{
    a functional data object containing a smooth of the data.
  }
  \item{df}{
    a degrees of freedom measure of the smooth
  }
  \item{gcv}{
    the value of the generalized cross-validation or GCV criterion.  If
    the function is univariate, GCV is a vector containing the error
    sum of squares for each function, and if the function is
    multivariate, GCV is a NVAR by NCURVES matrix.
  }
  \item{coef}{
    the coefficient matrix for the basis function expansion of
    the smoothing function
  }
  \item{SSE}{
    the error sums of squares.  SSE is a vector or a matrix of the same
    size as GCV.
  }
  \item{penmat}{
    the penalty matrix.
  }
  \item{y2cMap}{
    the matrix mapping the data to the coefficients.
  }
}
\seealso{
  \code{\link{smooth.basis}}
}
%\examples{}

% docclass is function
\keyword{smooth}
