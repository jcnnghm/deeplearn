FROM nvidia/cuda:7.5-cudnn5-devel
MAINTAINER Justin C <justin@bulletprooftiger.com>

RUN apt-get update && apt-get install -y \
  git \
  python2.7 \
  python-pip \
  python-dev \
  libhdf5-dev \
  python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

RUN pip install --upgrade \
  pandas \
  tables \
  https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0-cp27-none-linux_x86_64.whl \
  scikit-learn \
  ipython \
  jupyter

RUN rm -rf /notebooks/*
ADD *.ipynb /notebooks/
ADD notebook.sh /notebooks/notebook.sh

WORKDIR /notebooks
