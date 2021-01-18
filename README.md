
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ennet\_db: en-net Online Forum Database <img src="ennet_db.png" width="200px" align="right" />

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![](https://img.shields.io/badge/version-prerelease-orange)
[![](https://img.shields.io/badge/license-GPLv3-blue)](https://github.com/katilingban/ennet_db/blob/master/LICENSE.md)
[![ennet\_daily\_update](https://github.com/katilingban/ennet_db/workflows/ennet_daily_update/badge.svg)](https://github.com/katilingban/ennet_db/actions?query=workflow%3Aennet_daily_update)
[![ennet\_hourly\_update](https://github.com/katilingban/ennet_db/workflows/ennet_hourly_update/badge.svg)](https://github.com/katilingban/ennet_db/actions?query=workflow%3Aennet_hourly_update)
[![DOI](https://zenodo.org/badge/324514598.svg)](https://zenodo.org/badge/latestdoi/324514598)
<!-- badges: end -->

This repository serves the extracted text datasets from the [en-net
online forum](https://www.en-net.org) using the [`ennet
package`](https://katilingban.io/ennet/). Specifically, the
[`data`](https://github.com/katilingban/ennet_db/tree/main/data) folder
within this repository contains two sets of extracted data from the
[en-net online forum](https://www.en-net.org):

  - daily [en-net online forum](https://www.en-net.org) discussions
    dataset - these are CSV files named `ennet_discussions.csv`; and,

  - hourly [en-net online forum](https://www.en-net.org) topics dataset
    - these are CSV files named as `ennet_topics_YYY-MM-DD_HH:MM:SS`
    where `YYYY` is year, `MM` is month, `DD` is day, `HH` is hour, the
    second `MM` is minute, and `SS` is second.

Routine scheduled extraction is performed using [GitHub
Actions](https://github.com/katilingban/ennet_db/actions) workflows
found
[here](https://github.com/katilingban/ennet_db/tree/main/.github/workflows).

## What is `ennet_db` useful for?

`ennet_db` can be useful for those who would like to perform analysis on
the [en-net online forum](https://www.en-net.org) text dataset as
described [here](https://katilingban.io/ennet/) using analysis tools
other than [R](https://cran.r-project.org).

## Author

[Ernest Guevarra](https://ernest.guevarra.io)

## License

This work is licensed under a [GNU General Public License 3
(GPL-3)](https://github.com/katilingban/ennet_db/blob/master/LICENSE.md).

## Disclaimer

`ennet_db`is an independent development and is separate from and not
recognised and approved by the *[Emergency Nutrition Network
(ENN)](https://www.ennonline.net)*, the organisation that runs and
moderates the [**en-net** online forum](https://www.en-net.org). The
author and maintainer of this repository is not affiliated with
*[ENN](https://www.ennonline.net)* but is committed to ensuring that
`ennet_db` is compliant with [**en-net** online
forum](https://www.en-net.org)’s terms of use.

Any mistakes, problems and issues with `ennet_db` are that of the author
and maintainer of this repository and not of *[Emergency Nutrition
Network (ENN)](https://www.ennonline.net)*. Hence any problems and
issues with `ennet_db` should be addressed directly to the author and
maintainer [here](https://github.com/katilingban/ennet_db/issues).
