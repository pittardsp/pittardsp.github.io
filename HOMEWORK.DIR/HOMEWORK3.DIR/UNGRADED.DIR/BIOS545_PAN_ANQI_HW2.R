#545 HW2

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]
#(1)

sort(tapply(pres.data$contb_receipt_amt,pres.data$cand_nm, FUN=sum))

#(2)

biggest.donors<-function(candidate.name,x=3){
  if((!is.character(candidate.name))&(x!=round(x))){
    stop("not chatacter,not integer")
  } 
  
  if(!is.character(candidate.name)){
    stop("not chatacter")
  } 
  
  if (x!=round(x)){
    stop("not integer")
  }
  
  a<-pres.data[which(pres.data$cand_nm==candidate.name),]
  b<-a[order(a$contb_receipt_amt,decreasing = TRUE)[1:x],]
  return(b)
}

biggest.donors(candidate.name = "Trump, Donald J.", x =2)



#(3)
my.dna<-function(l=20,p=c(0.25,0.25,0.25,0.25)){
  if((l<=0)&(sum(p)!=1)&(!all((p>=0)&(p<=1)))){
    stop("not positive length of DNA sequence,total prob unequal to 1,invalid prob")
  }
  if((l<=0)&(sum(p)!=1)){
    stop("not positive length of DNA sequence,total prob unequal to 1")
  }
  if((l<=0)&(!all((p>=0)&(p<=1)))){
    stop("not positive length of DNA sequence,invalid prob" )
  }
  if((sum(p)!=1)&(!all((p>=0)&(p<=1)))){
    stop("total prob unequal to 1,invalid prob")
  }
  if(l<=0){
    stop("not positive length of DNA sequence")
  }
  if(sum(p)!=1){
    stop("total prob unequal to 1")
  }
  if(!all((p>=0)&(p<=1))){
    stop("invalid prob")
  }
dna.sequence<-sample(c("C","A","G","T"),l, replace = TRUE,prob=p)
b<-paste(dna.sequence, sep="", collapse="") 
c<-table(dna.sequence)/l
my.list<-list(dna.seq.compressed=b, dna.seq.separated=dna.sequence,sampling.probabilities=p, observed.frequencies=c)
return(my.list)
}

my.dna()

#(4)
mymat <- matrix(1:81,9,9)

prop_matrix<-function(somematrix,margin=1) { new=somematrix
  if(margin==1){
    for(i in 1:nrow(new)){a<-rowSums(somematrix)
      new[i,]=somematrix[i,]/a[i]
    }
  }else{
    for(i in 1:ncol(new)){a<-colSums(somematrix)
                          new[,i]=somematrix[,i]/a[i]
    }
  }
  return(new)
}

prop_matrix(mymat,1)
prop_matrix(mymat,2)

#(5)
mymat <- matrix(1:81,9,9)

margin_matrix<-function(matrix,margin=12){a=colSums(matrix)
                                          b=rowSums(matrix)
if(margin==1){
  new=cbind(matrix,b)
} else if(margin==2){
  new=rbind(matrix,a)
} else {c=cbind(matrix,b)
        d=colSums(c)
  new=rbind(c,d)
}
return(new)
}


margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)

#(6)

myf <- function(model,incr=0.1) {a<-seq( 0.1,  0.9, by=incr )
                                 b<-c()                                 
for(i in 1:length(a)){newpreds <- ifelse(as.vector(model$fitted.values) >=a[i],1,0)
            b[i]<-length(model[model$y!=newpreds])
}
        names(b)<-a
      return(b)
}

transmission_preds <- glm(am~mpg+wt,data=mtcars)
myf(transmission_preds,0.05)

