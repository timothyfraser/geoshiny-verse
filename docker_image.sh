:: #' @name docker_image.sh'
:: #'
:: #' @description A script to build this docker image.
:: #'
:: #' Reference info
:: #' - https://docs.docker.com/engine/reference/commandline/run/
:: #' - https://hub.docker.com/repository/docker/tmf77/geoshiny-verse/general

:: # Set your working directory, where the geoshiny-verse repository is located
cd = "C:\\Users\\tmf77\\OneDrive - Cornell University\\Documents\\rstudio\\geoshiny-verse"

:: # Pull docker container
:: # docker pull rocker/geospatial:4.2.3
:: # Build geoapp image
docker build -t tmf77/geoshiny-verse:version1 .

:: # Go copy keys_template.sh to key.sh and add your Docker personal access token. Needs read-write access.
:: # Load keys as environmental variables
keys.sh

:: # Log into docker with read-write privileges
docker login --username tmf77
:: # Assign it a tag
docker tag tmf77/geoshiny-verse:version1 tmf77/geoshiny-verse:version1

:: # Push it to Public DockerHub (there's no IP on this image, just basic settings)
docker image push tmf77/geoshiny-verse:version1

echo --------- done! ---------
