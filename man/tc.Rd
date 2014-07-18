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

#graphical display via boxplots
boxplot(tc~genotype, data=tc)

#calculating the allele frequencies
table(tc$genotype)#A is the minor allele

#definding the genotype as numeric value
tc$Genotype <- factor(tc$genotype, levels=c("G G","A G","A A"))
tc$numgeno <- as.numeric(tc$Genotype)

#pseudo numeric variables for each mode of inheritance
tc$add <- c(0, 0.5, 1)[tc$numgeno]
tc$rec <- c(0, 0, 1)[tc$numgeno]
tc$dom <- c(0, 1, 1)[tc$numgeno]

#Approach using three different genetic models
madd <- lm(tc~ add, data=tc) #lin reg add
mrec <- lm(tc~ rec, data=tc) #lin reg rec
mdom <- lm(tc~ dom, data=tc) #lin reg dom

#simultaneous assessment of multiple marginal models
g <- glht(mmm(m1=madd, m2=mrec, m3=mdom), mlf(m1="add=0", m2="rec=0", m3="dom=0"))
summary(g)
summary(g)$test$pvalues

}
\keyword{datasets}
