#' Helpers for working with inForm data
#'
#' phenoptr contains functions that make it easier to read and analyze data
#' tables and images created by PerkinElmer's inForm software.
#'
#' phenoptr is part of the PerkinElmer Phenoptics family of
#' Quantitative Pathology Research Solutions. For more information visit the
#' Phenoptics [home
#' page](http://www.perkinelmer.com/cancer-immunology/index.html).
#' @section Package options:
#' `read_cell_seg_data` converts pixel measurements to microns. Several other
#' functions also implicitly convert pixels to microns. The default conversion
#' is given by `getOption('phenoptr.pixels.per.micron')`, which has a default
#' value of 2 pixels/micron, i.e. pixels are 0.5 micron square
#' (the resolution of 20x MSI fields taken on Vectra Polaris and Vectra 3).
#' To use a
#' different value, either pass a `pixels_per_micron` parameter to functions
#' which take one, or set `options(phenoptr.pixels.per.micron=<new value>)`.
#' @md
"_PACKAGE"
