############ lab 1 - both guided and on your own ###############

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


########################## 2 #######################################################
# Estimating Probabilities using proportions
# declare the source for sampling
source = c(1:10)
sampling_size = 1
# sample a number from the source vector
rand_num = sample(source, sampling_size, replace)
if(rand_num > 4)
{
  b = rand_num
}

# generating a vector of 100 sampled random variables
num_of_sampling = 100
# preallocation of place holder vectors
sampled_nums = rep(NA, num_of_sampling)
sampled_nums_gt4 = rep(NA, num_of_sampling)

# index for sampled_nums_gt4
j = 1
for (i in 1:num_of_sampling)
{
  # get a sample 
  sampled_num = sample(source, sampling_size, replace = TRUE)
  # store it into the vector
  sampled_nums[i] = sampled_num
  # check if the sampled number is gt 4
  if(sampled_num > 4)
  {
    # store the sampled number in different vector if gt 4
    sampled_nums_gt4[j] = sampled_num
    # increment index for vector containing numbers gt 4
    j = j + 1
  }
}

proportion_of_nums_gt4 = length(sampled_nums_gt4)
print(proportion_of_nums_gt4)

#################### on your own Version ##########################################
num_of_samplings = 1000
rand_vector = rep(NA, times=num_of_samplings)
rand_vector_gt4 = rep(NA, times=num_of_samplings)

i = 1;
j = 1
repeat
{
  mynum = sample(1:10, 1, replace = TRUE)
  rand_vector[i] = mynum
  i = i+1
  if(mynum > 4)
  {
    rand_vector_gt4[j] = mynum
    j = j+1
  }
  
  if(i>=num_of_samplings)
  {
    # break if count >= 10 
    break
  }
}

print(length(rand_vector_gt4[!is.na(rand_vector_gt4)]))

########################## 3 #######################################################
# Challenge question lab1
# Ride to Statistics Department Annual Picnic
# Assuming window seat 1, otherwise 0
# matrix representing the car seat if a seat is window seat or not will of form
# NA(Drivers Seat) NA (Not a Seat)  1
# 1               0                 1
# 1               0                 1
## vectors defining the car seats
row1 = c(NA,NA,1)# 1 is window seat and 0 is not
row2 = c(1,0,1)
row3 = c(1,0,1)

# sample source for the seat is combination of all the vectors above
sample_matrix = matrix(c(row1, row2, row3), nrow = 3, ncol = 3, byrow = TRUE)
sample_source = rep(NA,times=7)

# go through each element in the sample matrix and construct the sample source
index = 1
for (i in 1:3)
{
  for (j  in 1:3)
  {
    if(!is.na(sample_matrix[i,j]))
    {
      sample_source[index] = sample_matrix[i,j]
      index = index + 1
    }
  }
}

# sampling counter
sampling_count = 0
# count of chances to get a window seat
got_win_seat_count = 0

for(sampling_count in 1:10)
{
  # sample a seat from available seats
  myseat = sample(sample_source, 1, replace = TRUE)
  # check if seat NA or not, NA seat is chosen, re-try the sampling
  if(1 == myseat)
  {
    # got window seat
    got_win_seat_count = got_win_seat_count + 1
  }
}

print(got_win_seat_count)

# to draw the number of mins a friend got late from normal distribution of mean=5 and variane=2
standard_dev = sqrt(2)

new_sampling_count = 0
got_win_seat_count_new = 0

for (new_sampling_count in 1:10)
{
  mins_late = rnorm(n=1, mean=5, sd=standard_dev)
  # if the person is late for more than 6 mins, keep 2nd row middle seat onoccupied
  if(mins_late > 6)
  {
    # if the friend is late for more than 6 mins, lets make 2nd row middle seat not available for sampling
    new_sample_source=c(sample_source[1:2], sample_source[4:7])
  }
  else
  {
    new_sample_source = sample_source
  }
  myseat = sample(new_sample_source, 1, replace = TRUE)
  if(1 == myseat)
  {
    got_win_seat_count_new = got_win_seat_count_new + 1
  }
  print(new_sample_source)
}
### print the values
print(got_win_seat_count)
print(got_win_seat_count_new)
