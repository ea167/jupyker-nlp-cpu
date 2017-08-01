# jupyker-nlp-cpu
Docker image for Jupiter notebook + Tensorflow + Keras + NLP: NLTK, Spacy, ConceptNet.
Same as [ea167/jupyker-nlp](https://hub.docker.com/r/ea167/jupyker-nlp) repo, but for CPU without gpu support.


##### Launch
Adjust the volume mount (`-v` option) and launch with:

```
    docker run -it -d -p=6006:6006 -p=8888:8888 \
        -v=~/DockerShared/JupykerShared:/host  ea167/jupyker-nlp-cpu
```

###  

and then connect your browser to:
* http://localhost:8888 for Jupyter Notebook
* http://localhost:6006 for TensorBoard
