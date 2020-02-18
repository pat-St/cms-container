# CMS bundle for apartment cms 

To clone the entire project, you have to use the following commands: 'git submodule init && git submodule update'

This project contains a frontend, backend, database and the api for the web-view, each of these as an independent microservice in serparate docker container.  

# Needed dependencies

* Bash >= 5
* Docker engine >= 19
* Docker-Compose >= 1.25

# First steps

To set the envoironmet varaibles you have to run the 'initial.sh' script. This is important for the correct configuration in the current env.
Following, you can now start the container with the 'docker-compose.yml' or the 'start.sh' script. 
