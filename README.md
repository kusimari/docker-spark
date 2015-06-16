# docker-spark

As of now a pyspark notebook for experiments.  
To build locally  
clone repo and in local repo  
sudo docker build -t local/docker-spark:1.3.1 .

To run from hub.docker
sudo docker run -p 0.0.0.0:8888:8888 -v \<host-dir\>:/home/\<container-dir\> -d kusimari/docker-spark:1.3.1 /etc/scripts/boot-ipython-local.sh

