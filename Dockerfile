FROM jupyter/pyspark-notebook:spark-3.3.2

USER root

# Install Python 3.8 and set it as the default Python version
RUN conda install -y python=3.8 && \
    conda clean --all --yes && \
    ln -sf /opt/conda/bin/python3.8 /usr/local/bin/python

USER $NB_UID

# Set the default Python version to 3.8 for Jupyter
RUN echo "python3.8" > /home/$NB_USER/.jupyter/python_kernel

CMD ["start-notebook.sh"]
