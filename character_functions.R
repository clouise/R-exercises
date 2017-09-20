library(tm)
txt <- system.file("texts", "txt", package = "tm")
ovid <- VCorpus(DirSource(txt, encoding = "UTF-8"),
                readerControl = list(language = "lat"))
TEXT <- lapply(ovid[1:5], as.character)
TEXT1 <- TEXT[[4]]
OVID <- c(data.frame(text=unlist(TEXT), stringsAsFactors = F))$text 

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
Words
unique(grep('[A-Z]', Words, value = TRUE))

# Which are the 5 most common letter in the object OVID?
OVID
Chars <- (unlist(strsplit(tolower(OVID), '')))
Char_Table <- table(Chars[Chars != ' '])
Char_Table[order(-Char_Table)][1:5]

# Which letters from the alphabet are not in the object OVID
letters[!letters%in%Chars]

# On the OVID object, there is a character from the popular sitcom ‘FRIENDS’ , Who is he/she?  There were six main characters (Chandler, Phoebe, Ross, Monica, Joey, Rachel)
OVID <-  gsub('[[:punct:]]','',OVID)
Words <- unlist(strsplit(OVID, '[[:blank:]]'))
Words
Friends <- c('Chandler','Phoebe', 'Ross', 'Monica', 'Joey', 'Rachel')
Friends[(Friends %in% Words)]

# Find the line where this character is mentioned
grep('Phoebe', OVID, value = F)
OVID[29]
grep('Phoebe', OVID, value = T)