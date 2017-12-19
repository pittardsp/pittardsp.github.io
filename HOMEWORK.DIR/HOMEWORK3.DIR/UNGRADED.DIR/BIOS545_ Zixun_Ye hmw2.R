# Homework 2
#Question 1
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv" 
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL) 
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]
sort(tapply(pres.data$contb_receipt_amt,pres.data$cand_nm,sum))


# Question 2
biggest.donors<-function(candidate.name,x=3){
  if(!is.character(candidate.name)|round(x)!=x){
    stop("Something wrong within either your candidate name or the return value")
  }
  table1<-pres.data[which(pres.data$cand_nm==candidate.name),]
  table2<-table1[order(table1$contb_receipt_amt,decreasing = T),]
  biggest<-table2[1:x,]
  return(biggest)
}

biggest.donors(candidate.name = "Trump, Donald J.", x = 3)
# Question 3

x<-c("C","A","G","T")
w<-sample(x,10,replace=T,prob=c(.25,.25,.25,.25))
w
h<-paste(w,collapse="")
h

create.dna<-function(n=20,cagt.probs=c(.25,.25,.25,.25)){
  dna<-sample(x,n,replace=T,prob=cagt.probs)
  for (i in 1:4)
  if(n < 0|cagt.probs[i] < 0|cagt.probs[i] > 1){
      warning("Please check your dna length or probabilty setting")
    }
     myreturnlist<-list()
     myreturnlist$dna.seq.compressed<-paste(dna,collapse="")
     myreturnlist$dna.seq.separated<-dna
     myreturnlist$sampling.probabilties<-cagt.probs
     myreturnlist$observed.frequencies<-table(dna)/10
     return(myreturnlist)
}
create.dna()
create.dna(10,cagt.probs=c(.25,.4,.3,.2))

# Question 4 

prop_matrix<-function(m,margin=1){
  retmat<-matrix()
  if(margin==1){
  retmat<-m/rowSums(m)
    }
  if(margin==2){
    retmat<-t(t(m)/colSums(m))
    }
   return(retmat) 
}

a<- matrix(1:4,2,2)
prop_matrix(a,1)
#         [,1]      [,2]
#[1,] 0.2500000 0.7500000
#[2,] 0.3333333 0.6666667
prop_matrix(a,2)
#              [,1]      [,2]
#[1,] 0.3333333 0.4285714
#[2,] 0.6666667 0.5714286
b<-matrix(2:9,2,4)
prop_matrix(b,1)
prop_matrix(b,2)

# Question 5
margin_matrix<-function(m,margin=12){
  retmat<-matrix()
  retmat<-rbind(cbind(m,rowSums(m)),colSums(cbind(m,rowSums(m))))
  if (margin==1){
    retmat<-cbind(m,rowSums(m))
  }
  if(margin==2){
    retmat<-rbind(m,colSums(a))
  }
  return(retmat)
}

a<- matrix(1:4,2,2)
margin_matrix(a,1)
margin_matrix(a,2)
margin_matrix(a,12)

# Question 6
transmission_preds <- glm(am~mpg+wt,data=mtcars)
as.vector(transmission_preds$fitted.values)
(newpreds <- ifelse(as.vector(transmission_preds$fitted.values) >=0.5,1,0))
table(our_preds=newpreds,actual=transmission_preds$y)
transmission_preds <-glm(am~mpg+wt,data=mtcars)
transmission_preds
names(transmission_preds)

myf<-function(model,incr=0.1){
  retvec<-vector()
  a<-seq(0.1,0.9,by=incr)
  for (i in 1:length(a)){
    b<-as.vector(model$fitted.values)
    prediction<-ifelse(b>=a[i],0,1)
    t<-table(prediction,model$y)
    n<-t[1,2]+t[2,1]
    retvec[i]<-n
    names(retvec)[i]<-a[i]
  }
  {
    return(retvec)
  }
}

myf(transmission_preds,.05)

