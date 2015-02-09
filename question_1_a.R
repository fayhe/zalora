dim1<-c("R1","R2")
dim2<-c("C1","C2","C3")
test_array <- array(c("a","b","c","d","e","f"),c(2,3),dimnames=list(dim1,dim2))
for (data in test_array)
  { print(data) }


