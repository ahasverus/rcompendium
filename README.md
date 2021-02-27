
# rcompendium <img src="man/figures/hexsticker.png" height="120" align="right"/>

<!-- badges: start -->

[![R-CMD-check](https://github.com/ahasverus/rcompendium/workflows/R-CMD-check/badge.svg)](https://github.com/ahasverus/rcompendium/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/mFD)](https://CRAN.R-project.org/package=mFD)
[![License: GPL
v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
[![LifeCycle](man/figures/lifecycle-experimental.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `rcompendium` is to create a research compendium, i.e. a
predefined folder structure with the following content:

    compendium           # Project Root
    │
    ├── .git             # Automatically created (or not)
    ├── .Rbuildignore    # Contains make.R and analysis/
    ├── .gitignore       # Specific to R projects
    ├── compendium.Rproj # Created by user (if using RStudio IDE)
    │
    ├── R/               # Contains R functions
    ├── man/             # Contains R functions helps (automatically updated)
    ├── DESCRIPTION      # Project metadata (author, date, dependencies, etc.)
    ├── NAMESPACE
    ├── LICENSE          # License GPL >=2
    ├── LICENSE.md       # Content of the GPL >=2 License
    |
    ├── analysis/
    │   ├── data/        # Contains user raw data (.csv, .xlsx, .shp, etc.)
    │   ├── rscripts/    # Contains R scripts to run analyses
    │   ├── outputs/     # Contains outputs created by user
    │   └── figures/     # Contains figures created by user
    ├── make.R           # Master R scripts to run all analyses
    │
    ├── README.md        # GitHub README (automatically updated)
    └── README.Rmd       # GitHub README (to rmarkdown::render)

**N.B. 1.** the research compendium can be built as an R package with
`devtools::install()` but only R functions stored in the **R/** folder
will be available (do not forget to edit R functions documentation and
to run `devtools::document()`). The content of the **analysis/** folder
must be run by sourcing the `make.R` file. All files created by user
must be saved in the subfolders of **analysis/**.

**N.B. 2.** the files `DESCRIPTION` and `make.R` are written from
templates and are specific to myself.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ahasverus/rcompendium")
```

## Usage

Under RStudio, you first need to create a **New project** (with or
without initializing git versioning). If you do not use RStudio IDE, you
need to create a **New folder** and to open R in this directory (by
using `setwd()`).

**N.B.** the name of the compendium will be the same as the current
directory. Don’t worry you will be ask before any file is created.

Then you can create the compendium:

``` r
rcompendium::new_compendium()
```

You can now start working!

## Citation

Please cite this package as:

> Casajus N. (2021) rcompendium: An R package to create a research
> compendium. Version 1.0.0, &lt;URL:
> <https://github.com/ahasverus/rcompendium>&gt;.

## Code of Conduct

Please note that the `rcompendium` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
