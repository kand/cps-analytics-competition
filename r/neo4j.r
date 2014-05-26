install.packages('RCurl')
install.packages('RJSONIO')

library('bitops')
library('RCurl')
library('RJSONIO')

Neo4j <- setRefClass(
  'Neo4j',
  fields = c(
      host = 'character',
      port = 'numeric'
  ),
  methods = c(
    doQuery = function(queryString) {

      h = basicTextGatherer()
      
      fullURL = paste("http://", .self$host, ":", .self$port, "/db/data/cypher", sep="")
      curlPerform(
        url = fullURL,
        postfields = paste('query',curlEscape(queryString), sep='='),
        writefunction = h$update,
        verbose = FALSE
      )           
      
      result <- fromJSON(h$value())
      data <- data.frame(t(sapply(result$data[[1]][[1]]$data, unlist)))
      
      return(data)
      
    }
  )
)
