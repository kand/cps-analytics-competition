require('bitops')
require('RCurl')
require('RJSONIO')

Neo4j <- setRefClass(
  'Neo4j',
  
  fields = c(
      host = 'character',
      port = 'numeric'
  ),
  
  methods = c(
    
    initialize = function(host = 'localhost', port = 7474) {
      
      host <<- host
      port <<- port
      
    },
    
    query = function(queryString) {

      h = basicTextGatherer()
      
      fullURL = paste("http://", .self$host, ":", .self$port, "/db/data/cypher", sep="")
      curlPerform(
        url = fullURL,
        postfields = paste('query',curlEscape(queryString), sep='='),
        writefunction = h$update,
        verbose = FALSE
      )           
      
      return(fromJSON(h$value()))
      
    },
    
    queryFrameResults = function(queryString, refClass) {

      results = .self$query(queryString)
      
# TODO : add a casting function to domain objects, call it here to build domain object from result
      #return(data.frame(t(sapply(result$data[[1]][[1]]$data, unlist))))
      
    }
    
  )
)
