# in your Dockerfile
FROM sphinxdoc/sphinx-latexpdf

WORKDIR /docs
# ADD requirements.txt /docs
RUN apt-get update -y && \
    apt-get install -y fonts-ipafont fonts-takao pandoc inkscape && \
    pip3 install sphinx_rtd_theme \
    recommonmark \
    sphinx-markdown-tables \
    ipython \
    nbsphinx \
    sphinxcontrib-svg2pdfconverter
