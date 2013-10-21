library(plyr)

# read command line arguments
args <- commandArgs(TRUE)
INPUT  <- args[1]
OUTPUT  <- args[2]

iDat <- read.delim(INPUT) # read in data


# clean data and save table
removeContinent <- "Oceania"
gDat <- droplevels(subset(iDat, continent != removeContinent))
write.table(gDat, OUTPUT, quote = FALSE,
            sep = "\t", row.names = FALSE)