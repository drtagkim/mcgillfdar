\name{var.fd}
\alias{var.fd}
\title{
  Variance, Covariance, and Correlation Surfaces for
  Functional Data Object(s)   
}
\description{
  Compute variance, covariance, and / or correlation functions for
  functional data.  

  These are two-argument functions and therefore define surfaces. If
  only one functional data object is supplied, its variance or
  correlation function is computed.  If two are supplied, the covariance
  or correlation function between them is 
  computed.  
}
\usage{
var.fd(fdobj1, fdobj2=fdobj1)
}
\arguments{
  \item{fdobj1, fdobj2}{
    a functional data object.
  }
}
\details{
  a two-argument or bivariate functional data object representing the
  variance, covariance or correlation surface for a single functional
  data object or the covariance between two functional data objects or
  between different variables in a multivariate functional data object.
  
}
\value{
  An list object of class \code{bifd} with the following components:
  
  \item{coefs}{
    the coefficient array with dimensions fdobj1[["basis"]][["nbasis"]]
    by fdobj2[["basis"]][["nbasis"]] giving the coefficients of the 
    covariance matrix in terms of the bases used by fdobj1 and
    fdobj2.  
  }
  \item{sbasis}{
    fdobj1[["basis"]]
  }
  \item{tbasis}{
    fdobj2[["basis"]]
  }
  \item{bifdnames}{
    dimnames list for a 4-dimensional 'coefs' array.  If
    length(dim(coefs)) is only 2 or 3, the last 2 or 1 component of
    bifdnames is not used with dimnames(coefs).  
  }

  Examples below illustrate this structure in simple
  cases.  
}
\seealso{
  \code{\link{mean.fd}}, 
  \code{\link{sd.fd}}, 
  \code{\link{std.fd}}
  \code{\link{stdev.fd}}
}
\examples{
##
## Example with 2 different bases 
##
daybasis3 <- create.fourier.basis(c(0, 365))
daybasis5 <- create.fourier.basis(c(0, 365), 5)
tempfd3 <- with(CanadianWeather, data2fd(dailyAv[,,"Temperature.C"], 
       day.5, daybasis3, argnames=list("Day", "Station", "Deg C")) )
precfd5 <- with(CanadianWeather, data2fd(dailyAv[,,"log10precip"],
       day.5, daybasis5, argnames=list("Day", "Station", "Deg C")) )

# Compare with structure described above under 'value':
str(tempPrecVar3.5 <- var.fd(tempfd3, precfd5))

##
## Example with 2 variables, same bases
##
gaitbasis3 <- create.fourier.basis(nbasis=3)
str(gaitfd3 <- data2fd(gait, basisobj=gaitbasis3))
str(gaitVar.fd3 <- var.fd(gaitfd3))


# Check the answers with manual computations 
all.equal(var(t(gaitfd3$coefs[,,1])), gaitVar.fd3$coefs[,,,1])
# TRUE
all.equal(var(t(gaitfd3$coefs[,,2])), gaitVar.fd3$coefs[,,,3])
# TRUE
all.equal(var(t(gaitfd3$coefs[,,2]), t(gaitfd3$coefs[,,1])),
          gaitVar.fd3$coefs[,,,2])
# TRUE

# NOTE:
dimnames(gaitVar.fd3$coefs)[[4]]
# [1] Hip-Hip
# [2] Knee-Hip 
# [3] Knee-Knee
# If [2] were "Hip-Knee", then
# gaitVar.fd3$coefs[,,,2] would match 
#var(t(gaitfd3$coefs[,,1]), t(gaitfd3$coefs[,,2]))
# *** It does NOT.  Instead, it matches:  
#var(t(gaitfd3$coefs[,,2]), t(gaitfd3$coefs[,,1])),

##
## The following produces contour and perspective plots
##
# Evaluate at a 53 by 53 grid for plotting

daybasis65 <- create.fourier.basis(rangeval=c(0, 365), nbasis=65)

daytempfd <- with(CanadianWeather, data2fd(dailyAv[,,"Temperature.C"],
       day.5, daybasis65, argnames=list("Day", "Station", "Deg C")) )
str(tempvarbifd <- var.fd(daytempfd))

str(tempvarmat  <- eval.bifd(weeks,weeks,tempvarbifd))
# dim(tempvarmat)= c(53, 53)

op <- par(mfrow=c(1,2), pty="s")
#contour(tempvarmat, xlab="Days", ylab="Days")
contour(weeks, weeks, tempvarmat, 
        xlab="Daily Average Temperature",
        ylab="Daily Average Temperature",
        main=paste("Variance function across locations\n",
          "for Canadian Anual Temperature Cycle"),
        cex.main=0.8, axes=FALSE)
axisIntervals(1, atTick1=seq(0, 365, length=5), atTick2=NA, 
            atLabels=seq(1/8, 1, 1/4)*365,
            labels=paste("Q", 1:4) )
axisIntervals(2, atTick1=seq(0, 365, length=5), atTick2=NA, 
            atLabels=seq(1/8, 1, 1/4)*365,
            labels=paste("Q", 1:4) )
persp(weeks, weeks, tempvarmat,
      xlab="Days", ylab="Days", zlab="Covariance")
mtext("Temperature Covariance", line=-4, outer=TRUE)
par(op)

}
% docclass is function
\keyword{smooth}
