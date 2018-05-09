FROM rocker/shiny
MAINTAINER Paul Campbell (paul@cultureofinsight.com)
    
## install packages from CRAN (and clean up)
RUN Rscript -e "install.packages(c('rlang', 'shinydashboard'), repos='https://cran.rstudio.com/')" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## assume shiny app is in build folder /app2
COPY ./app /srv/shiny-server/docker-test/

## updated config file
COPY ./shiny-server.conf /etc/shiny-server/shiny-server.conf