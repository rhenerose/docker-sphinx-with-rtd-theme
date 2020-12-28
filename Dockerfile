# in your Dockerfile
FROM sphinxdoc/sphinx-latexpdf

WORKDIR /docs
ADD requirements.txt /docs
RUN apt-get update -y && \
    apt-get install -y fonts-ipafont pandoc && \
    pip3 install -r requirements.txt