docker build -t visualpy:1.1.9 .
docker run -it -p 8888:8888 --name visualpy visualpy:1.1.9