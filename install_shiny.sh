sudo apt-get update && \
   sudo apt-get -y install gdebi-core && \
   wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.20.1002-amd64.deb && \
   sudo gdebi -n shiny-server-1.5.20.1002-amd64.deb