# set the name of the date file
filename = 'hooker.csv'
# get current working directory
setwd('/Users/pawankarki/Desktop/rProjects/r-for-beginner')

# set full filename 
full_filename = paste(getwd(), filename, sep = '/')

hooker_data = read.table(full_filename, header = TRUE, sep = ',', na.strings = c('-', ' '))
plot(hooker_data$boilingPoint, hooker_data$pressure,pch=20)
slr_model = lm(formula = hooker_data$pressure~ hooker_data$boilingPoint, hooker_data)
abline(slr_model$coefficients[1], slr_model$coefficients[2], col ='red')
#summary(slr_model)