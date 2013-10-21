library(lattice)

# command line arguments
args <- commandArgs(TRUE)
INPUT  <- args[1]
FIG_KOREA  <- args[2]
FIG_LE <- args[3]

gDat <- read.delim(INPUT)

# from http://rpubs.com/majugi/stat545a-2013-hw02_gingerich-mat
pdf(FIG_KOREA)
xyplot(gdpPercap ~ year | country, gDat, 
       subset = country %in% c("Korea, Rep.","Korea, Dem. Rep."), 
       type = c("p", "smooth"))
dev.off() 

# shows how life exp changes with time
pdf(FIG_LE)
densityplot(~lifeExp | as.factor(year),
            data = gDat,
            subset = year %in% seq(from = 1957, to = 2007, by =10),
            groups = reorder(continent,lifeExp), # reorders legend
            auto.key = list(columns = nlevels(gDat$continent)),
            plot.points=FALSE
            )
dev.off() 