# run from root directory, default name "stat545a-2013-hw06_woollard-geo"
# bash> chmod u+x setup.sh ; ./setup.sh

mkdir data fig 	# set up directories

curl http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt > data/gapminderDataFiveYear.txt	# get data

Rscript code/cleanData.R data/gapminderDataFiveYear.txt data/clean_gapminderDataFiveYear.tsv	# clean data
	
#fig/fig.pdf: code/plotData.R data/clean_gapminderDataFiveYear.tsv
Rscript code/plotData.R data/clean_gapminderDataFiveYear.tsv fig/korea_north_vs_south.pdf fig/lifeExp_year_density.pdf
	
Rscript code/linearModel.R data/clean_gapminderDataFiveYear.tsv fig/ 5	# fit linear model and save fig of top countries
