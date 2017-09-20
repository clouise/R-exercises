if (!'tm' %in% installed.packages()) install.packages('tm')
library(tm)
TEXT = system.file("texts", "txt", package = "tm")
ovid = VCorpus(DirSource(TEXT, encoding = "UTF-8"),
               readerControl = list(language = "lat"))
OVID = c(data.frame(text=unlist(TEXT), stringsAsFactors = F))
TEXT = lapply(ovid[1:5], as.character)
TEXT1 = TEXT[[4]]

# Delete all the punctuation marks from TEXT1
TEXT1 <- gsub('[[:punct:]]','',TEXT1)

# How many letters does TEXT1 contains?
sum(nchar(gsub('[[:blank:]]', "",TEXT1)))

# How many words does TEXT1 contains?
Words <- unlist(strsplit(TEXT1, '[[:blank:]]'))
length(Words[Words != ''])

# What is the most common word in TEXT1?
Words <- unlist(strsplit(TEXT1, '[[:blank:]]'))
Words <- Words[Words != '']
Table <- table(tolower(Words))
Table[order(-Table)]

# Get an object that contains all the words with at least one capital letter (Make sure the object contains each word only once)