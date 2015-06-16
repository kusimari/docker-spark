#!/bin/bash
cd /home && PYSPARK_DRIVER_PYTHON="ipython" PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip 0.0.0.0 --port 8888 --no-browser" /opt/spark/bin/pyspark --verbose --master local[2]
