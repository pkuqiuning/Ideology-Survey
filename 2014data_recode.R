#setwd("this is where you put the data file")
data<- read.csv("2014data.csv", stringsAsFactors=FALSE)
library(reshape)
library(car)
names(data) <- c("id", "time","ip", "voting", "human_rights", 
                   "information", "multi_party", "freedom_of_speech",
                   "college_exam", "religion", "military_training",
                   "national_unity", "due_process", "foreign_aid",
                   "leader", "lynch", "media_interest", "national_interest",
                   "military_taiwan", "lawyer", "foreign_nationality",
                   "china_power", "sports", "minimum_wage", "reform_benefit",
                   "collective_interest", "waste_food", "pork", "tariff",
                   "public_education", "soe_national_interest", "real_estate", "low_income",
                   "medical", "income_source", "finance_sector", "soe_sell_capitalist", 
                   "soe_national_security", "capital_cumulation", "land_ownership",
                   "grain_price", "foreign_capital", "monopoly", "voluntary_sex",
                   "older_generation", "confucianism", "art", "birth_control",
                   "zhouyi", "chinese_medicine", "simplify_chinese", 
                   "classic_literature", "homosexual", "sex", "birthyear",
                   "income", "education")

data[data=="强烈反对"]<-1
data[data=="反对"]<-2
data[data=="同意"]<-3
data[data=="强烈同意"]<-4
data$female[data$sex=="F"]<- 1
data$female[data$sex=="M"]<- 0
data$income<-recode(data$income,"'0-25k'=1;'25k-50k'=2;'50k-75k'=3;
                    '75k-100k'=4;'100k-150k'=5;'150k-300k'=6;'300k+'=7")
data$education<- recode(data$education, "'初中及以下'=1;'高中'=2;
                        '大学'=3;'研究生及以上'=4")
View(data)

## Convert the whole data frame into a numeric matrix, if needed ##
data[c(4:53, 55:58)] <- sapply(data[c(4:53, 55:58)],as.numeric)
data$age<- 2015-data$birthyear
View(data)

