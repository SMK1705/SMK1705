# library(anytime)
# library(dplyr)
# library(forecast)
# data = read.csv("C:\\SMK\\DA\\R\\Project\\Titan.csv")
# data
# View(data)
# head(data)
# summary(data)
# str(data)
# # data$OPEN = as.numeric(gsub(",","",as.character(data$OPEN)))
# # data$HIGH = as.numeric(gsub(",","",as.character(data$HIGH)))
# # data$LOW = as.numeric(gsub(",","",as.character(data$LOW)))
# for (x in 2:11) {
#   data[,x] = as.numeric(gsub(",","",data[,x]))
# }
# data$Date=anydate(data$Date)
# # data[,2:11] = as.numeric(gsub(",","",as.character(data[,2:11])))
# summary(data)
# str(data)
# 
# 
# inds <- seq(as.Date("2022-08-13"), as.Date("2022-12-11"), by = "day")
# 
# create_ts <- function(col_idx){
#   ## Create a time series object
#   i_ts <- as.numeric(data[,3]) %>%
#     tsclean(replace.missing = TRUE, lambda = NULL) %>%
#     ts(start = c(2022, as.numeric(format(inds[1], "%j"))),
#        frequency = 365.5)
#   return(i_ts)
#   
library(anytime)
library(dplyr)
library(forecast)
data = read.csv("C:\\SMK\\DA\\R\\Project\\Titan.csv")
data
View(data)
head(data)
summary(data)
str(data)

for (x in 2:11) {
  data[,x] = as.numeric(gsub(",","",data[,x]))
}
# data[,2:11] = as.numeric(gsub(",","",as.character(data[,2:11])))
data$Date=anydate(data$Date)
summary(data)
str(data)

b=xts(data[,2:11],order.by = data[,1]) # converting to time series object


inds <- seq(as.Date("2021-08-13"), as.Date("2022-12-26"), by = "day")

create_ts <- function(col_idx){
  ## Create a time series object
  i_ts <- as.numeric(data[,3]) %>%
    tsclean(replace.missing = TRUE, lambda = NULL) %>%
    ts(start = c(2022, as.numeric(format(inds[1], "%j"))),
       frequency = 365.5)
  return(i_ts)
}