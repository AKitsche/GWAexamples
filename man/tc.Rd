\name{tc}
\alias{tc}
\docType{data}
\title{
Quantitative trait locus
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(tc)}
\format{
  A data frame with 525 observations on the following 8 variables.
  \describe{
    \item{\code{ID}}{a numeric vector}
    \item{\code{sex}}{a numeric vector}
    \item{\code{age}}{a numeric vector}
    \item{\code{tc}}{a numeric vector}
    \item{\code{genotype}}{a factor with levels \code{A A} \code{A G} \code{G G}}
    \item{\code{x0}}{a numeric vector}
    \item{\code{x1}}{a numeric vector}
    \item{\code{x2}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(tc)
boxplot(tc~genotype, data=tc)
}
\keyword{datasets}
