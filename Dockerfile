FROM rocker/shiny
MAINTAINER Paul Campbell (paul@cultureofinsight.com)
    
## install packages from CRAN (and clean up)
RUN Rscript -e "install.packages(c('rlang', 'shinydashboard'), repos='https://cran.rstudio.com/')" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds