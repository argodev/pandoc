FROM ubuntu:latest

RUN apt-get -q --no-allow-insecure-repositories update \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        texlive-full \
        pandoc
        # \
        #ttf-ubuntu-font-family

RUN apt-get install python3-pip --assume-yes
RUN python3 -m pip install pandoc-latex-environment 


# TODO clean up after apt gets