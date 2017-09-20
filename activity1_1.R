########## LAB 1 ###############################

# 1. Working with objects in R:
x=4
y=6
z=0.57
a=3.7
# vector v1 consits of all of variables above
v1 = c(x,y,z,a)
# initializing vector v2
v2 = c(1,2,3,4)
# combine v1 and v2 to get a combined vector
v1_v2 = c(v1,v2)
# construcying matrix b from v1_v2 vector
num_row = 2
num_col = 4
b = matrix(v1_v2,nrow = num_row, ncol = num_col, byrow = TRUE)

# now get column vector of matrix one at a time, calculate mean and store in a vevtor
coln_mean = c(NA, num_col)
for (i in 1:num_col)
{
  coln_vector = b[,i]
  coln_means[i] = mean(coln_vector)
}
print(coln_means)

#################### on your own Version ###########################################
x=4
y=6
z=0.57
a=3.7
v1 = c(x,y,z,a)
a = matrix(v1, nrow = 2, ncol = 2, byrow = TRUE)
rep(v1, times=25)