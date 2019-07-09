#' getWordFrequency
#'
#' This function accepts corpus as defined by the tm package and
#' analyzes word frequency.
#'
#' @param corpusToPrepare the input corpus to prepare for text analysis
#' @param omitStop omit strop words (T/F)
#' @param omitUselessTerms omit terms which are useless to the analysis (T/F)
#' @param firstWordRankInPlot first number of word to plot in ranked list
#' @param lastWordRankInPlot last number of word to plot in ranked list
#' @param freqPlot produce a frequency plot (T/F)
#' @param uselessTerms terms which do not improve the analysis
#' @return a corpus object containing prepared text of the original corpus
#' @examples getCorpus(corpusToPrepare)

getWordFrequency <- function (
    literatureCorpus = "",
    omitStop = TRUE,
    omitUselessTerms = TRUE,
    firstWordRankInPlot = 1,
    lastWordRankInPlot = 30,
    freqPlot = TRUE,
    uselessTerms = c("result", "fig", "tabl", "use", "research", "total",
                     "can")
){
  library(pdftools)
  library(NLP)
  library(tm)
  library(tidytext)
  library(reshape2)
  library(ggplot2)

  if (!any(attr(literatureCorpus, "class") == "Corpus")){
    stop("The input must be of class corpus from the tm package.")
  }


  #remove potentially problematic symbols
  toSpace <- content_transformer(function(x, pattern) {
    return (gsub(pattern, ' ', x))
  })
  literatureCorpus <- tm_map(literatureCorpus, toSpace, '-')

  tdm <- TermDocumentMatrix(
    literatureCorpus,
    control = list(removePunctuation = TRUE,
                   stopwords = omitStop,
                   tolower = TRUE,
                   stemming = TRUE,
                   removeNumbers = TRUE)
  )

  frequentTerms <- findFreqTerms(tdm, lowfreq = 1, highfreq = Inf)

  if (omitUselessTerms){
    frequentTerms <- frequentTerms[!(frequentTerms %in% uselessTerms)]
  }

  frequentTerms.tdm <- as.matrix(tdm[frequentTerms,])

  wordcount <- rowSums(frequentTerms.tdm)

  if (freqPlot){

    topWords <- sort(wordcount, decreasing=TRUE)[
      c(firstWordRankInPlot:lastWordRankInPlot)]

    dfplot <- as.data.frame(melt(topWords))
    dfplot$word <- dimnames(dfplot)[[1]]
    dfplot$word <-
      factor(dfplot$word,
             levels = dfplot$word[order(dfplot$value, decreasing=TRUE)])

    fig <- ggplot(dfplot, aes(x=word, y=value)) + geom_bar(stat="identity")
    fig <- fig + xlab("Word in pdf files")
    fig <- fig + theme(axis.text.x = element_text(angle = 90))
    fig <- fig + ylab("Count")
    print(fig)
  }

  return(data.frame(word = frequentTerms, wordcount = wordcount))
}
