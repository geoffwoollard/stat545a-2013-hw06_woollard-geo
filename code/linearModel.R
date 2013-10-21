library(plyr)
library(lattice)
library(MASS)
library(foreign)


# command line arguments
args <- commandArgs(TRUE)
INPUT  <- args[1]
FIG  <- args[2]
N <- as.numeric(args[3])

gDat <- read.delim(INPUT)# get data

# from https://gist.github.com/sibyl229/6668047/38da61c901940e7f354e5fb6b02ac8c4fbf9d28a
max_residual <- function(cDat){
  clm <- lm(lifeExp ~ I(year-min(cDat$year)), data=cDat)
  largestResidual <- abs(clm$residuals)
  maxRsdl <- max(largestResidual)
  return(c(Max.Residual=maxRsdl,
           year=cDat[which.max(largestResidual),'year']))
}

numCountries  <- N
interesting <- ddply(gDat, ~country + continent, max_residual)
interesting <- arrange(interesting, abs(Max.Residual), decreasing=T)

# hack for labeing outliers
df <- merge(gDat, interesting,by="country")
df <- cbind(df, outlier = with(df,(year.x==year.y)))
df  <- rename(df,c("year.x"="year", 'continent.x'='continent'))
df <- subset(df,select=-c(year.y,continent.y))
        

# panel plot
# http://stackoverflow.com/questions/16361766/multiple-ablines-in-xyplot
myPanel <- function(x,y,...) {
  panel.xyplot(x,y,...)
  panel.abline(lm(y~x), type="l", col="blue",...)
  panel.abline(rlm(y~x), type="l", col="red",...)
}

lmKey  <- simpleKey(columns=2,text=c('robust','ordinary'), points=FALSE,col=c('red','blue'))

# top outliers
pdf(paste0(FIG,'outliers_top.pdf'))
xyplot(lifeExp ~ year | country, 
       #data = gDat,
       data = df, 
       subset = country %in% head(interesting,numCountries)$country, 
       group = outlier,
       panel=myPanel, 
       key=lmKey
       #group = (country == "Rwanda" & year == 1992) | (country == "Cambodia" & year == 1977),
       #type = c("p", "r")#,
       #auto.key=TRUE
)
dev.off() 

# d_ply function to save multiple plots inspred by https://github.com/jennybc/STAT545A/blob/f984c46666bb462adabef0412833ff96fa074080/hw06_scaffolds/01_justR/02_aggregatePlot.R
d_ply(df, ~continent, 
      #subset = country %in% head(interesting[with(interesting,continent == as.),])$country,
        function(x){
          interesting <- ddply(x, ~country + continent, max_residual)
          interesting  <- arrange(x,-1*Max.Residual)
          interesting  <- unique(subset(interesting,select=country))
          theContinent <- x$continent[1]
          pdf(paste0(FIG,'outliers_',theContinent,'.pdf'))
          plt  <- xyplot(lifeExp ~ year | country, data=x, panel=myPanel, group = outlier,
                         subset = country %in% head(interesting,numCountries)$country,
                         key=lmKey
                         )
          print(plt)
          dev.off()
        } 
      )