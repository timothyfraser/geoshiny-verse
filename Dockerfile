FROM rocker/geospatial:4.2.3
MAINTAINER "Tim Fraser" tmf77@cornell.edu

# Set image root as working directory
WORKDIR /

# Run extra package installation!
#    By separating them out into separate lines/layers,
#    It means each layer can be cached separately, 
#    reducing future build time when re-building the image multiple times.

# Install Shiny Server
RUN R -e "install.packages('shiny', repos='https://cran.rstudio.com/')"
RUN R -e "install.packages('shinyjs', repos='https://cran.rstudio.com/')"

# Remove any /srv/shiny-server folder and contents
RUN rm -rf /srv/shiny-server/*


# Update shiny server
RUN sudo apt-get update

WORKDIR /root/scripts
COPY install_shiny.sh .
RUN ./install_shiny.sh

ENV S6_VERSION=v2.1.0.2
ENV SHINY_SERVER_VERSION=latest
ENV PANDOC_VERSION=default

RUN /rocker_scripts/install_shiny_server.sh

EXPOSE 3838


RUN R -e "install.packages('shinyWidgets')"
RUN R -e "install.packages('shinydashboard')"
RUN R -e "install.packages('plotly')"
RUN R -e "install.packages('shinycssloaders')"
RUN R -e "install.packages('viridis')"
RUN R -e "install.packages('optparse')"
RUN R -e "install.packages('googledrive')"

# Set shiny-server/app as working directory
WORKDIR /srv/shiny-server/app

# Copy into this directory
# COPY app .

# Set shiny-server/ as working directory
WORKDIR /srv/shiny-server/

# Copy index into /srv/shiny-server
COPY index.html .


CMD ["/init"]