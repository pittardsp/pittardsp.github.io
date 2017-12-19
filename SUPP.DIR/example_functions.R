inches2meters <- function(x) {
# 1 meter = 39.6
  return(x/39.6)
}

feet2meters <- function(x) {
# 1 meter = 3.3 feet  
  return(x/3.3)
}

lbs2kg <- function(x) {
  return(x/2.2)
}

bmi <- function(kg,m) {
  bm = kg/(m^2)
  classif = ""
  if (bm < 18.5) {
    classif = "UW"
  } else if ( bm >= 18.5 & bm < 25){
    classif = "NO"
  } else if ( bm >=25 & bm < 30) {
    classif = "OW"
  } else if ( bm >= 30 ) {
    classif = "OB"
  }
  return(list(bmi=bm,classif=classif))
}

