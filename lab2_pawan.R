############### lab 2 Guided ########################################
############### problem 1 ########################################
a=2
b=-1
c=-5
## calculate descriminint
descriminant = b^2-(4*a*c)
# check for positive descriminant
if(descriminant > 0)
{
  root1 = (-b+sqrt(descriminant))/(2*a)
  root2 = (-b-sqrt(descriminant))/(2*a)
}

############### problem 2 ########################################
x=1.5
# value calculation
value = (1/5)*exp(-x/5)
# function definition without defining user defined function
if(x >= 0)
{
  z = (1/3)*exp(-x/3)
}else
{
  z = 0
}

#### user defined function definition fname f.x and parameters x
f.x=function(x)
{
  if(x >= 0)
  {
    ret_val = (1/3)*exp(-x/3) 
  }else
  {
    ret_val = 0
  }
  
  # return the calculated value
  return(ret_val)
}

## calculations using the user defined functions
f.x(-2)
f.x(0)
f.x(1.5)

##### challenge 
input_seq = seq(from = -5, to = 5, by = 0.1)
loop_count = length(input_seq)
func_value = rep(NA, times=loop_count)
for (i in 1:loop_count)
{
  func_value[i] = f.x(input_seq[i])
}

####### on your own Bonus
# user defined function that takes a seq and a function as arguments and returns a vector containing 
# function values for each numbers in the sequence
calculate_fx_values = function(num_seq, gx)
{
  seq_length = length(num_seq)
  gx_values = rep(NA, times=seq_length)
  for (i in 1:seq_length)
  {
    gx_values[i] = gx(num_seq[i])
  }
  
  return(gx_values)
}

## test the function
calculate_fx_values(c(-2,0,1.5),f.x)