
library(data.table)


my_data <- read_xlsx("/Users/navyarao/Downloads/matrix.xlsx")

my_data[is.na(my_data)]<-0

my_data$yrmnth<-gsub("-.*", "\\1",my_data$yrmnth)

unique_vals<-unique(my_data$yrmnth)
total_monthly<-data.frame()
for(i in 1:length(unique_vals)){
  new<-subset(my_data,yrmnth==unique_vals[i])
  total_cal<-sum(new$Tot)
  total_monthly<-rbind(total_monthly,total_cal)
}
month_data<-my_data[,-c(1,2,137)]
output<-data.frame()
total_monthly<-data.frame(total_monthly)

#####create indicator
A<-matrix(1:16,4)
d<-row(A)-col(A) 
j=rev(split(A,d))

d<-row(month_data)-col(month_data)

j=rev(split(month_data,d))


# use split to group on these values

j = j[((length(j)+1)/2):(length(j))]
diagsum = list()
for(i in (1:length(j))){
  diagsum = append(diagsum,sum(unlist(j[i])))
  
}

diagsum






A <- matrix(1:16, 4)

# create an indicator for all diagonals in the matrix
d <- row(month_data) - col(month_data)

# use split to group on these values
j = rev(split(month_data, d))
j = j[((length(j)+1)/2):(length(j))]
diagsum = list()
for(i in (1:length(j))){
  diagsum = append(diagsum,sum(unlist(j[i])))
  
}

diagsum


