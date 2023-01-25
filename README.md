# Rob's Base Pandoc Image

This is a customized version of the [pandoc](https://pandoc.org/) image
that contains a number of tools that I use/need for my normal builds.

It is built upon the latest Ubuntu and the `texlive-full` package. This
allows for using `xelatex` and a number of other packages natively. 
Additionally, it has the `pandoc-latex-environment` filter installed.

Otherwise, it is intended to be used in the same manner as the
official pandoc images. 


## Usage

There are a couple of ways of using this image, depending on what 
works best for you. For infrequent use, I tend to do something 
like the following:

```bash
docker run -it --rm --user "$(id -u):$(id -g)" -v $PWD:/data argodev/pandoc input.md \
    -o output.pdf \
    --from markdown \
    --template mytemplate.tex \
    --listings \
    --filter pandoc-latex-environment \
    --toc \
    --number-sections \
    --pdf-engine=xelatex
```

Of course, everything starting with `input.md` is just the normal parameters that you would pass to `pandoc` if you were running it directly on your system.  The business with the `--user` parameters is to ensure that the permissions on the resulting `*.pdf` match that of the caller and not set to `root:root`.

If I'm setting up for frequent use, I'd create an alias in my `.bashrc` or `.zshrc` file, something
like the following:

```text
alias pandoc='docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) argodev/pandoc'
```

## Change Log

- 2023-01-25
    - Updating to use GitHub actions to build
    - Building/deploying multi-architecture images



## Helpful Links

[pandoc]: https://pandoc.org/
[LaTeX]: https://latex-project.org/
[TeX Live]: https://www.tug.org/texlive/

