% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.blocks.R
\name{get.blocks}
\alias{get.blocks}
\title{Get data.frame with data on all US Census 2010 blocks (pop, lat/lon, etc.)}
\usage{
get.blocks(fields = c("fips", "pop", "lat", "lon", "area", "urban"),
  charfips = TRUE)
}
\arguments{
\item{fields}{Optional vector of character elements specifying which fields to return.}

\item{charfips}{Optional TRUE by default, specifies if FIPS should be converted to character class with any necessary leading zeroes,
which uses more RAM and takes much longer -- It can take 1-2 minutes for this function to return results unless charfips=FALSE.}
}
\value{
Returns a (large, >11 million rows) dataframe that has specified fields
  or by default these 6 columns: fips, pop, lat, lon, area, urban
}
\description{
Returns a large dataframe with one row per block. This helps assemble the desired fields for all 11m+ blocks, into a single data.frame.
}
\details{
Warning: It can take 1-2 minutes for this function to return results with default settings (i.e., unless charfips=FALSE is specified).
  The full blocks data.frame created by default uses approximately 1 GB of RAM.
  The blocks data.frame with just numeric fips and pop uses only about 133 MB and is
}
\examples{
\dontrun{
# To assemble blocks data.frame:
# 1) Much faster if charfips=FALSE, but
#    then cannot treat fips as character with leading zeroes where needed:
blocks <- get.blocks( charfips=FALSE )
# To convert numeric to character fips later:
blocks$fips <- lead.zeroes(blocks$fips, 15)
# 2) Slower way, but can get fips as character to begin with:
blocks <- get.blocks()
# To get just certain fields:
blocks <- get.blocks(c('fips','pop'))
# This function using defaults is the equivalent of the following:
#   require(UScensus2010blocks)
#   blocks <- data.frame(
#     fips=lead.zeroes(blocks.fips,15),
#     pop=blocks.pop,
#     lat=blocks.lat,
#     lon=blocks.lon,
#     area=blocks.area,
#     urban=blocks.urban
#   )
}
}
\seealso{
\code{\link{blocks.fips}}  and \code{\link[UScensus2010]{UScensus2010}}
}
\concept{
demographics
}

