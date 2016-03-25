## using openNLP package to invoke a tagger and extract all the nouns from the tagged text

test2_3 <- function(){
  
  ## for using function startsWith
  if(!("gdata" %in% installed.packages())){
    install.packages("gdata", dependencies = T)
  }
  
  ## POS tagger
  if(!("openNLP" %in% installed.packages())){
    install.packages("openNLP", dependencies = T)
  }
  if(!("NLP" %in% installed.packages())){
    install.packages("NLP", dependencies = T)
  }
  library(gdata)
  library(NLP)
  library(openNLP)
  
  ## sample string
  s <- "R is a collaborative project with many contributors.
  Type 'contributors()' for more information and
  'citation()' on how to cite R or R packages in publications."
  
  sentoken <- openNLP::Maxent_Sent_Token_Annotator(language = "en")
  wordtoken <- openNLP::Maxent_Word_Token_Annotator()
  postagger <- openNLP::Maxent_POS_Tag_Annotator()
  
  ## annotating
  a1 <- annotate(s, sentoken)
  a2 <- annotate(s, wordtoken, a1)
  a3 <- annotate(s, postagger, a2)
  
  
  ## extracting only words
  a3 <- subset(a3, a3$type == "word")
  
  ## extracting only nouns - In which case POS feature starts with an N
  ## we can similarly do it for verbs by replacing N by V and can make it
  ## a paramenter in the function to make it more versatile
  temp <- unlist(lapply(a3$features, "[[", "POS"))
  a3 <- a3[startsWith(temp, 'N')]
  
  ## printing each noun found using the POS tagger
  for(i in c(1:length(a3$features))){
    ## using the start and end markers for the given word
    print(substr(s,a3$start[[i]], a3$end[[i]]))
  }
}