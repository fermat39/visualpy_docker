FROM ubuntu
LABEL maintainer="fermat39 / Kim Young Ha"
LABEL version="1.0"
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y iproute2
RUN apt-get install -y nano
RUN apt-get install -y python3
RUN apt-get install -y pip
RUN pip3 install visualpython jupyter_contrib_nbextensions numpy pandas matplotlib seaborn
RUN useradd -m visualpy
USER visualpy
RUN jupyter contrib nbextension install --user
RUN visualpy install
RUN jupyter notebook --generate-config
RUN sed -i "s/\# c.NotebookApp.allow_origin = ''/c.NotebookApp.allow_origin = '*'/" /home/visualpy/.jupyter/jupyter_notebook_config.py
RUN sed -i "s/\# c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = ''/" /home/visualpy/.jupyter/jupyter_notebook_config.py
RUN sed -i "s/\# c.NotebookApp.token = '<generated>'/c.NotebookApp.token = ''/" /home/visualpy/.jupyter/jupyter_notebook_config.py
RUN sed -i "s/\# c.NotebookApp.password = ''/c.NotebookApp.password = ''/" /home/visualpy/.jupyter/jupyter_notebook_config.py
WORKDIR /home/visualpy
RUN pip3 freeze > requirements.txt
CMD ["jupyter", "notebook"]
EXPOSE 8888