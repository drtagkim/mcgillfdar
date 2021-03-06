\name{melanoma}
\alias{melanoma}
\title{
  melanoma 1936-1972
}
\description{
     These data from the Connecticut Tumor Registry present
     age-adjusted numbers of melanoma skin-cancer incidences per
     100,000 people in Connectict for the years from 1936 to 1972.
}
\format{
  A data frame with 37 observations on the following 2 variables.
    \describe{
	\item{year}{
	  Years 1936 to 1972.
	}
	\item{incidence}{
	  Rate of melanoma cancer per 100,000 population.
	}
    }
}
\details{
  This is a copy of the 'melanoma' dataset in the 'lattice' package.  It
  is unrelated to the object of the same name in the 'boot' package.   
}
\source{
  Ramsay, James O., and Silverman, Bernard W. (2006), \emph{Functional
    Data Analysis, 2nd ed.}, Springer, New York. 
}
\seealso{
  \code{\link[lattice]{melanoma}}
  \code{\link[boot]{melanoma}}
}
\examples{
plot(melanoma[, -1], type="b")
}
% docclass is function
\keyword{datasets}

