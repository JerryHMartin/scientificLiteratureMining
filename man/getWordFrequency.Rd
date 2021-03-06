% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getWordFrequency.R
\name{getWordFrequency}
\alias{getWordFrequency}
\title{getWordFrequency}
\usage{
getWordFrequency(literatureCorpus = "", omitStop = TRUE,
  omitUselessTerms = TRUE, firstWordRankInPlot = 1,
  lastWordRankInPlot = 30, freqPlot = TRUE,
  uselessTerms = c("result", "fig", "tabl", "use", "research", "total",
  "can"))
}
\arguments{
\item{omitStop}{omit strop words (T/F)}

\item{omitUselessTerms}{omit terms which are useless to the analysis (T/F)}

\item{firstWordRankInPlot}{first number of word to plot in ranked list}

\item{lastWordRankInPlot}{last number of word to plot in ranked list}

\item{freqPlot}{produce a frequency plot (T/F)}

\item{uselessTerms}{terms which do not improve the analysis}

\item{corpusToPrepare}{the input corpus to prepare for text analysis}
}
\value{
a corpus object containing prepared text of the original corpus
}
\description{
This function accepts corpus as defined by the tm package and
analyzes word frequency.
}
\examples{
getCorpus(corpusToPrepare)
}
