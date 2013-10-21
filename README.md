stat545a-2013-hw06_woollard-geo
======

These scripts examines world demographics, as part of a university course taught by [Dr. Jennifer Bryan](http://www.stat.ubc.ca/~jenny/). 
Her course materials are [here](https://github.com/jennybc/STAT545A). 
The [official gapminder site](http://www.gapminder.org/) has videos.
I drew from [stackoverflow](http://stackoverflow.com/) threads, and examples from Dr. Bryan and classmates. I have attributed in the code as much as I can reasonably recall at this time.

To examine life expectancy and population the world over, first clone the repository, then run the shell script `setup.sh`. 

```bash
git clone https://github.com/geoffwoollard/stat545a-2013-hw06_woollard-geo.git
cd stat545a-2013-hw06_woollard-geo
chmod u+x setup.sh
./setup.sh

###output###
ls -ltr	fig
#lifeExp_year_density.pdf	# life expectancy changes over time
#korea_north_vs_south.pdf	# GDP per capita of North and South Korea
#outliers_top.pdf
#outliers_Africa.pdf			# ... for respective continents
#outliers_Asia.pdf			# linear model (life expectancy ~ year), comparing robust and ordinary methods
#outliers_Americas.pdf
#outliers_Europe.pdf

ls -ltr data
# gapminderDataFiveYear.txt			# gapminder data from Dr. Bryan
# clean_gapminderDataFiveYear.tsv	# cleaned gapminder data without Oceania (New Zealand and Australia)
```

# Requirements:
* Linux or Mac OS X
* [R](http://www.r-project.org/), specifically the `Rscript` command-line interface
* R packages: `plyr`, `lattice`, `MASS`, `foreign`
* [curl](http://linux.about.com/od/commands/l/blcmdl1_curl.htm)


Here's some details about my computer, in case I missed any requirements
```r
R> sessionInfo()
R version 3.0.1 (2013-05-16)
Platform: x86_64-apple-darwin10.8.0 (64-bit)

locale:
[1] en_CA.UTF-8/en_CA.UTF-8/en_CA.UTF-8/C/en_CA.UTF-8/en_CA.UTF-8

attached base packages:
[1] graphics  grDevices utils     datasets  stats     methods   base     

other attached packages:
[1] ggplot2_0.9.3.1 plyr_1.8        lattice_0.20-23

loaded via a namespace (and not attached):
 [1] colorspace_1.2-3   dichromat_2.0-0    digest_0.6.3       grid_3.0.1         gtable_0.1.2      
 [6] labeling_0.2       MASS_7.3-29        munsell_0.4.2      proto_0.3-10       RColorBrewer_1.0-5
[11] reshape2_1.2.2     scales_0.2.3       stringr_0.6.2      tools_3.0.1 
``` 
