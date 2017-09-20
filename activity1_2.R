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

