# NOTE: to run:
# 	docker run -it -d -p=6006:6006 -p=8888:8888 -v=~/DockerShared/JupykerShared:/host  ea167/jupyker-nlp-cpu
#
# http://localhost:8888 for Jupyter Notebook
# http://localhost:6006 for TensorBoard
#
# Built for CPUs

FROM ea167/jupyker-cpu
LABEL maintainer="Eric Amram <eric dot amram at gmail dot com>"


# NLP related:
# NLTK
RUN pip3 --no-cache-dir install \
    nltk \
    gensim
# Download all NLTK data
RUN python3 -m nltk.downloader -d /usr/local/share/nltk_data all \
 && echo "export NLTK_DATA=/usr/local/share/nltk_data" >> /root/.bashrc

# Spacy
RUN pip3 --no-cache-dir install  spacy
# Download available languages
RUN python3 -m spacy download en \
 && python3 -m spacy download fr \
 && python3 -m spacy download de

# ConceptNet
RUN pip3 --no-cache-dir install  conceptnet
# Download all models
### RUN python3 -m conceptnet.models import *


CMD jupyter notebook --allow-root --no-browser --ip=* --NotebookApp.password="$PASSWD" \
    & /bin/bash
