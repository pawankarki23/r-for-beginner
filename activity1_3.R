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