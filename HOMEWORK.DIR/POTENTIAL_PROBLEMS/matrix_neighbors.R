X = matrix(1:9,3,3)

# Write a function that given any i and j you can find the
# value of the neighbors

# neighbors are at [i,j-1], [i,j+1], [i-1,j], [i+1,j], 
# [i-1,j-1], [i-1,j+1], [i+1,j-1], [i+1,j+1]

neighbors <- function(X,i,j) {
  retvec = vector()
  rows = nrow(X)
  cols = ncol(X)
  
  if ( (i > 1) & (j >1) & (i < rows) & (j < cols)) {
     retvec = append(retvec,
                     c(X[i,j-1],X[i,j+1],X[i-1,j],X[i+1,j],
                       X[i-1,j-1],X[i-1,j+1],X[i+1,j-1],
                       X[i+1,j+1]))
     
  } else if ( (i > 1) & (j == 1) & (i < rows) & (j < cols)) {
     retvec = append(retvec,c(X[i,j+1],X[i-1,j],X[i+1,j],
                              X[i-1,j+1],X[i+1,j+1]))
    
  } else if ( (i == 1) & (j > 1) & (i < rows) & (j < cols)) {
       retvec = append(retvec,
           c(X[i,j-1],X[i,j+1],X[i+1,j],
            X[i+1,j-1],
             X[i+1,j+1]))
    
  } else if ( (i > 1) & (j >1) & (i <= rows) & (j < cols)) {
       retvec = append(retvec,c(X[i-1,j],X[i,j+1],X[i-1,j+1]))
  }
  return(retvec)
  
}