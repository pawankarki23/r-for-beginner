#### section 2 - vectors in R ########

# generating sequence - simplest method
x=1:5
print(x)

# repeating a vector
f=c(1,2,3,4,5)
g=rep(f, times=5) # repeat the vector 5 times
print(g)
h=rep(f,each=2)## repeat each element 2 times
print(h)


## generating sequence using seq function 
x=seq(from=5, to=100, by=10) # can mention length
print(x)

### logical vectors 
y=c(12,34,5,2,6, NA)
v=y>10 # compares each element of vector y with 10 and forms logical vector
print(v) # notice NA remains same - any operation on NA would result NA

### Missing Values NA (Not Available)
# any operation on NA results NA
z=c(1:3,NA,0/0) # 0/0 is Not a Number NAN
a=is.na(z) # is.na returns true for NAN
print(a)
print(is.nan(z)) # is.nan returns true only for NAN

### character vector 
str = 'Pawan Karki'
print(str)

### Concatenate vectors after converting to character.
paste(1:10)
t=paste(c('X', 'Y'), c('p','a', 'w'), sep='')# sep is black space by default
print(t)

### Index vectors
# a logical vector
v=c(-1,2,3,4,5,NA)
u=v[!is.na(v)] # select only non-missing values
print(u)
(v+1)[!is.na(v) & v > 0] # select non missing & positive values from v+1

# vector of positive integral quantities
v[1:3] # select first three components of vector

# vector of negetive integral quantities
v[-(1:3)] # exclude first three components of vector

# vector of character string (named elements in vector)
fruit=c(1,5,3)
names(fruit)=c('apple', 'orange', 'mango')
fruit[c('apple','mango')]

# replaces all the NA variables with 0
x[is.na(x)] = 0