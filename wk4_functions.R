# Function to input a set of numbers
# out a numerb that can be stored to a variable
# myfunction <- function(arg1, arg2, ...)
# {
#  
#  return retVal
# }


add_percent <- function(my_num, multiplier = 100, digits_in = 1) 
{
  # multiple input by 100 and only show one digit
 percent <- round(my_num * multiplier, digits = digits_in)
 results <- paste(percent, "%", sep ="")  
 
 # return the calulation
 return(results)
}

sample_vector <- c(0.458, 1.663, 0.8654)
add_percent(sample_vector, 10, 2)


my_stats <- function(my_num, func_type = "parametric", print_or_not = FALSE) 
{
  # multiple input by 100 and only show one digit
  # percent <- round(my_num * multiplier, digits = digits_in)
  # results <- paste(percent, "%", sep ="")  
  if (func_type == "nonparametric") 
  {
    results <- c(median(my_num), mad(my_num))
    
  }
  else
  {
    results <- c(mean(my_num), sd(my_num) )
  }
  
  if (print_or_not)
      print(results)
  # return the calulation
  return(results)
}

sample_vector <- c(3, 4, 5)
my_stats(sample_vector, "nonparametric")

sample_vector <- c(3, 4, 5, 6, 7)
my_stats(sample_vector, "nonparametric", TRUE)


