FROM ubuntu:latest
LABEL maintainer='Rob Gillen <argodev+pandoc@gmail.com>'

# install required packages
RUN apt-get -q --no-allow-insecure-repositories update \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
        texlive-full \
        pandoc \
        python3-pip \
  && rm -rf /var/lib/apt/lists/        

# install required python packages
RUN python3 -m pip install pandoc-latex-environment 

# set the entrypoint
ENTRYPOINT ["/usr/bin/pandoc"]

# set the workdir
WORKDIR /data
