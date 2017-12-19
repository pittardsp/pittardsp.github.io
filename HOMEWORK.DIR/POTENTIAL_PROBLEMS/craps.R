#These faces contain 1, 2, 3, 4, 5 and 6 spots. When the dice have come to 
#rest, the sum of the spots on the two upward faces is calculated.

#(i) If the sum is 7 or 11 on the first throw, the player wins.

#(ii) If the sum is 2, 3, or 12 on the first throw, the play er loses.

#(iii) If the sum is 4, 5, 6, 8, 9 or 10 on the first throw, the sum 
#becomes the player’s point. To win, you must continue rolling the dice until 
#you make your point. However, the player loses by rolling a 7 before making the point"

craps <- function(verbose=T) {
  
  # FUNCTION: craps - a simulation of a craps game
  # INPUT: none
  # OUTPUT: A vector indicating the winning (or losing) roll.
  
  iters = 0
  x = sum(ceiling(6*runif(2)))  # Roll the dice and add up the results

  # If you get a 7 or 11 on the first roll then you win
  
  if (x == 7 | x == 11) {
      return(c(roll=x, win=TRUE, iterations=iters))
      
  # So now you want to match the number you got on the first roll. This
  # is known as the "point".
  
  } else if (x == 2 | x == 3 | x == 12) {
     return(c(roll=x,win=FALSE,iterations=iters))
  
  } else {
      cat("Number to match is ",x,"\n")
      newx = sum(ceiling(6*runif(2)))
      iters = iters + 1
      
  # While you don't get the point, a 7, or 11 then you keep rolling
  
      while (newx != x & newx != 7) {
        if (verbose) {cat("roll is ",newx,"\n")}
        newx = sum(ceiling(6*runif(2)))
        iters = iters + 1
      }
  
  # If you get a 7 or 11 after the first roll then you don't win
  
      if (newx == 7) {
          return(c(roll=newx,win=FALSE,iterations=iters))
          
  # If your roll matches the point then you win.
  
      } else if (newx == x) {
          return(c(roll=x, win=TRUE,iterations=iters))
      }
  }
}