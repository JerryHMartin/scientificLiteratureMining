#' getCorpusFromPDFDirectory
#'
#' This function accepts a folder of pdf journal articles and returns
#' a corpus object containing the text of the pdf files.
#'
#' @param literatureFileDirectory directory of pdf files to count words from.
#' @return a corpus object containing the text of a directory of pdf files
#' @examples getCorpus(literatureFileDirectory)
#'
#'

getCorpusFromPDFDirectory = function (literatureFileDirectory = ""){

    library(tm)
    
    if (literatureFileDirectory == ""){
        stop("A directory of pdf files is needed for this function")
    }

    if (!dir.exists(literatureFileDirectory)){
        stop("The specified directory does not exist")
    }

    setwd(literatureFileDirectory)

    return(Corpus(URISource(list.files(pattern = "pdf$")),
                               readerControl = list(reader = readPDF)))
}
