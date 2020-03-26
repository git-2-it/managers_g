# read and manipulate diabetes data

my_data <- read.csv("Diabetes-md.csv", header=TRUE, sep=",")

# show structure
structure(my_data)

# Show the class and structure of the data
class(my_data)
str(my_data)

# Check on N/a
is.na(my_data)
sum(is.na(my_data))

my_data[!complete.cases(my_data),]

# Some fields are missing data

my_data$Address[my_data$Address == ""] <- NA
my_data$Daibetes.type[my_data$Daibetes.type == ""] <- NA
my_data$Status[my_data$Status == ""] <- NA

my_data[!complete.cases(my_data),]

# All empty should be converted to NA, but looking at teh str appears like there still empties
str(my_data)

# Need to convert to a char first, then convert back to a factor to alert R there is a change
my_data$Daibetes.type <- as.character(my_data$Daibetes.type)

str(my_data)

my_data$Daibetes.type <- as.factor(my_data$Daibetes.type)

str(my_data)

my_data$Status <- as.character(my_data$Status)
my_data$Status <- as.factor(my_data$Status)

my_data$Address <- as.character(my_data$Address) # Keeping address as char
#my_data$Address <- as.factor(my_data$Address)

str(my_data$Status)

my_data$Status
# Ordering on status
Status <- factor(my_data$Status, order = TRUE, levels = c("Excellent", "Improved", "Poor"))

# Deal with teh missing data
# chart missing data

#----------------------------------------------------------------------------
# Graphically display missing data
#----------------------------------------------------------------------------

library(mice)
md.pattern(my_data)

library(VIM)
missing_values <- aggr(my_data, prop = FALSE, numbers = TRUE)
# Show summary of the contents of missing_values
summary(missing_values)







