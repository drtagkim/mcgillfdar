svd2 <- function(x, nu = min(n, p), nv = min(n, p), LINPACK = FALSE){
# svd sometimes fails with a cryptic error message.
# In such cases, store the matrix in '.svd.error.matrix'
# and try again with !LAPACK.
# If that also fails, issue an error message.  
    dx <- dim(x)
    n <- dx[1]
    p <- dx[2]
    svd.x <- try(svd(x, nu, nv, LINPACK))
    if(class(svd.x)=="try-error"){
      nNA <- sum(is.na(x))
      nInf <- sum(abs(x)==Inf)
      if((nNA>0) || (nInf>0)){
        msg <- paste("sum(is.na(x)) = ", nNA,
                     "; sum(abs(x)==Inf) = ", nInf,
                     ".  'x stored in .svd.x.NA.Inf'",
                     sep="")
        assign('.svd.x.NA.Inf', x, env = .GlobalEnv)
        stop(msg)
      }      
      attr(x, "n") <- n
      attr(x, "p") <- p      
      attr(x, "LINPACK") <- LINPACK
      .x2 <- c('.svd.LAPACK.error.matrix',
              '.svd.LINPACK.error.matrix')
      .x <- .x2[1+LINPACK]
      assign(.x, x, env = .GlobalEnv)
      msg <- paste('svd failed using LINPACK = ', LINPACK,
                   " with n = ", n, ' and p = ', p, 
                   ";  x stored in '", .x, "'", 
                   sep="")
      warning(msg)
#
      svd.x <- try(svd(x, nu, nv, !LINPACK))
      if(class(svd.x)=="try-error"){
        .xc <- .x2[1+!LINPACK]
        assign(.xc, x, env=.GlobalEnv) 
        stop("svd also failed using LINPACK = ", !LINPACK,
             ";  x stored in '", .xc, "'")
      }
    }
    svd.x 
}
