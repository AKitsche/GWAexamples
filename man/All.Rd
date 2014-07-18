\name{All}
\alias{All}
\docType{data}
\title{
Case-control study - combined groups
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(All)}
\format{
  A data frame with 7830 observations on the following 5 variables.
  \describe{
    \item{\code{y}}{a factor with levels \code{Cases} \code{Control}}
    \item{\code{x0}}{a numeric vector, dummy coding for homozygous T}
    \item{\code{x1}}{a numeric vector, dummy coding for heterozygous}
    \item{\code{x2}}{a numeric vector, dummy coding for homozygous G}
    \item{\code{Genotype}}{a factor with levels \code{GG} \code{GT} \code{TT}}
  }
}
\details{
Case-control study of severe falciparum malaria for association with the SNP rs10900589 of the ATPase, Capp transporting, plasma membrane 4 (ATP2B4)gene. The data set summarizes the data from the Ghanaian GWAs group, Ghanaian replication group and the Gambian GWAs group.
}
\source{
Timmann C, Thye T, Vens M et al: Genome-wide association study indicates two novel resistance loci for severe malaria. Nature 2012; 489: 443-446.
}
\references{
C. Loley, I.R Koenig, L. Hothorn, and A. Ziegler. A unifying framework for robust association testing, estimation, and genetic model selection using the generalized linear model. European Journal of Human Genetics, 21(12):1442-1448, 2013.
}
\examples{
data(All)
table(All$y,All$Genotype)
#graphical display
mosaicplot(with(All, table(y, Genotype)),main="")

#calculating minor allele frequency
sum(All[,3],2*All[,4])/(2*nrow(All))
#in this case "G" is the minor allele
All$Genotype <- factor(All$Genotype, levels=c("TT","GT","GG"))
All$GenNum <- as.numeric(All$Genotype)

#pseudo numeric variables for different modes of inheritance
All$Add <- c(0, 0.5, 1)[All$GenNum]
All$Dom <- c(0, 1, 1)[All$GenNum]
All$Rec <- c(0, 0, 1)[All$GenNum]

#Approach using three different genetic models
GLMdom <- glm(y ~ Dom ,family=binomial, data=All)
GLMadd <- glm(y ~ Add ,family=binomial, data=All)
GLMrec <- glm(y ~ Rec ,family=binomial, data=All)

#simultaneous assessment of multiple marginal models
g <- glht(mmm(m1=GLMdom, m2=GLMadd, m3=GLMrec), mlf(m1="Dom=0", m2="Add=0", m3="Rec=0"))
summary(g)
summary(g)$test$pvalues

}
\keyword{datasets}
