## argument is the url for the zip file download of the texttaken from the harvest
## page such as  http://www.gutenberg.org/robot/harvest?filetypes[]=txt&langs[]=en&offset=100
## from the Gutenberg project.

test1 <- function(texturl="http://www.gutenberg.lib.md.us/etext00/utrkj10.zip"){
  ## to grab the last part of the url
  
  filename <- strsplit(texturl, "\\/")
  filename <- strsplit(filename[[1]][length(filename[[1]])], "zip")
  
  ## replacing the .zip with .txt
  filename <- paste(filename[1], "txt", sep = "")
  
  ## downloading it to a temporary file
  file <- tempfile()
  download.file(texturl, file)
  
  ## unzipping and reading into doc
  doc <- readLines(unz(file, filename))

  ## splitting away the part upto which we require the text
  s<-strsplit(doc, "End of The Project Gutenberg Etext")
  print(s)
  closeAllConnections()
}