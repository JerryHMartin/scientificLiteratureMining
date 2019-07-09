# scientificLiteratureMining
Mine Scientific Literature in R

This package wraps multiple packages in R to perform basic data mining in scientific literature.  

This package is primarily intended to do the simplest of analysis in scientific literature.

### Installing scientificLiteratureMining

Instructions for installing devtools can be found at https://www.r-project.org/nosvn/pandoc/devtools.html.
To install this library 

```r
    library(devtools)
    install_github("agriculturist/scientificLiteratureMining")
```

### Loading Library

After the library is installed it is to be loaded.

```r
    library(scientificLiteratureMining)
```

### Basic Text Analysis

Get a folder and fill it full of pdf documents containing the literature you want to analyze.

Use the getCorpusFromPDFDirectory function to load all of the pdf files into a single corpus.

Use the getWordFrequency function to see which words occur most often

