
<!-- README.md is generated from README.Rmd. Please edit that file -->

# indiceH

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

O objetivo do pacote indiceH é apresentar os resultados do artigo…

## Instalação

Você pode instalar o pacote indiceH disponível no
[Github](https://github.com/AraeCaina/indiceH) usando:

``` r
# install.packages("devtools")
devtools::install_github("AraeCaina/indiceH")
```

## Exemplo

Esse pacote possui apenas uma função, que é a responsável por abrir o
aplicativo shiny. Rode o seguinte código:

``` r
library(indiceH)
indiceH::run_app()
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.
