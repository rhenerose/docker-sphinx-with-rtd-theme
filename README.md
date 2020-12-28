# docker-sphinx-with-rtd-theme

Based Docker image :

- `sphinxdoc/sphinx-latexpdf`  
<https://hub.docker.com/r/sphinxdoc/sphinx-latexpdf>  
contains TeXLive packages. So the image is very large (over 2GB!).  
<https://github.com/sphinx-doc/docker>

Custom added packages :

- fonts-ipafont
- pandoc

Custom added Python modules:

- sphinx_rtd_theme
- recommonmark
- sphinx-markdown-tables
- ipython
- nbsphinx

## How To Use

Build docker image and Make Sphinx documents.  
Please replace placeholders `<your_tag>`, `</your/document/path>` with your environment.

1. Build docker image.  

    Build docker image from `Dockerfile`.  

    ```bash
    docker build -t <your_tag> ./
    ```

1. Make Sphinx Document.

    If you want to create a new Sphinx project, execute the following command.

    ```bash
    # Create new shpinx template project 
    docker run -it --rm -v </your/document/path>:/docs <your_tag> sphinx-quickatart ./
    ```

    Run `make html` or `make latexpdf`.

    ```bash
    # make html
    docker run --rm -v </your/document/path>:/docs <your_tag> make html

    # make latexpdf
    docker run --rm -v </your/document/path>:/docs <your_tag> make latexpdf
    ```

## Example

for example, set image tag `rhene/sphinx-latexpdf`, mount current directory and execute `make html`

```bash
# clone this repository
git clone https://github.com/rhenerose/docker-sphinx-with-rtd-theme
cd docker-sphinx-with-rtd-theme

# build docker image
docker build -t rhene/sphinx-latexpdf ./

# chage directory to your sphinx project path
cd /your/document/path

# mount current directory and execute `make html`
# bash or PowerShell
docker run --rm -v "$(pwd):/docs" rhene/sphinx-latexpdf make html

# cmd.exe
docker run --rm -v "%cd%:/docs" rhene/sphinx-latexpdf make html
```
