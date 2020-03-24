FROM openanalytics/r-base

MAINTAINER Tobias Verbeke "tobias.verbeke@openanalytics.eu"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0

# 安装mysql 驱动 为了安装RMySQL

RUN apt-get install -y libmariadb-client-lgpl-dev	
	
# system library dependency for the euler app
RUN apt-get update && apt-get install -y \
    libmpfr-dev


	
# basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'))"

# install dependencies of the euler app
RUN R -e "install.packages('Rmpfr')"

RUN R -e "install.packages("RMySQL")"

RUN R -e "install.packages("DT")"

# copy the app to the image
RUN mkdir /root/euler
COPY euler /root/euler

COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/euler')"]
