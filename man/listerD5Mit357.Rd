\name{listerD5Mit357}
\alias{listerD5Mit357}
\docType{data}
\title{
Data on Listeria monocytogenes susceptibility (marker D5Mit357)
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(listerD5Mit357)}
\format{
  A data frame with 116 observations on the following 6 variables.
  \describe{
    \item{\code{pheno}}{a numeric vector representing the survival time}
    \item{\code{geno}}{a factor with levels \code{AA} \code{Aa} \code{aa}}
    \item{\code{cens}}{a logical vector}
    \item{\code{x0}}{a numeric vector, dummy coding for homozygous A}
    \item{\code{x1}}{a numeric vector, dummy coding for heterozygous}
    \item{\code{x2}}{a numeric vector, dummy coding for homozygous a}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Victor Boyartchuk and William Dietrich (Department of Genetics, Harvard Medical School and Howard Hughes Medical Institute) \url{http://genetics.med.harvard.edu/~bdlab}
}
\references{
Boyartchuk, V. L., Broman, K. W., Mosher, R. E., D'Orazio S. E. F., Starnbach, M. N. and Dietrich, W. F. (2001) Multigenic control of Listeria monocytogenes susceptibility in mice. Nature Genetics 27, 259-260.
}
\examples{
data(listerD5Mit357)
#Kaplan-Meier plot
kapmei <- survfit(Surv(pheno, cens) ~ geno, data = listerD5Mit357)
plot(kapmei, lty = c(3,4,1))
legend("topright", legend = c("aa", "Aa", "AA"), lty = c(3,4,1))
}
\keyword{datasets}
