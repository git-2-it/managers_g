# load manager dataset

# Create the managers data frame
# Refer to notes "creating a dataset - problem" on Blackboard 
# for more information

column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Enter data into vectors before constructing the data frame
date_col <- c("2018/15/10", "2018/01/11", "2018/21/10", "2018/28/10", "2018/01/05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all vectors above
managers <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using column_names vector
colnames(managers) <- column_names

# Recode the incorrect 'age' data to NA
managers$Age[managers$Age == 99] <- NA

# Create a new attribute called AgeCat and set relevant valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly

# We will also recode age 'NA' to Elder
managers$AgeCat[managers$Age >= 45] <- "Elder"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elder"

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll store the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(managers$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Replace managers AgeCat attribute with newly ordinal foctored data
managers$AgeCat <- AgeCat

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- managers$Q1 + managers$Q2 + managers$Q3 + managers$Q4 + managers$Q5
summary_col

# Add summary_col to the end of the data frame
managers <- data.frame(managers, summary_col)

# Calculate mean value for each row
mean_value <- rowMeans(managers[5:9])

# Add mean_value to end of managers data frame
managers <- data.frame(managers, mean_value)

# Show data frame contents
managers

# Change the name of this column to "mean value"
names(managers)[12] <- "mean value"

# Change name of summary_col to "Answer total"
names(managers)[11] <- "Answer total"

# Show managers structure
str(managers)

# Change the date structure from the factor
# to the required date structure

# Note : We cannot convert a factor variable to date
# without first converting to a character variable
# from the default factor variable
date_field   <- as.character(managers$Date)
new_date <- as.Date(date_field, "%Y/%d/%m")
str(new_date)

# Now overwrite the contents of the date field with new date structure
managers$Date = new_date
str(managers)

## Now with the new managers data

new_managers_data <- read.csv("C:/workspace/R/managers_g/MoreData.csv", header=TRUE, sep=",")

# show structure
structure(new_managers_data)

# choose records to merge
# ie, export only the data of interest, picking certain columns only
# view column headers
names(new_managers_data)
names(managers)

include_list <- new_managers_data[c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")]
# or like this ...
include_list <- new_managers_data[c(6, 3, 7, 4, 8:12)]

include_list

str(include_list)

# convert datae field
# Note : We cannot convert a factor variable to date
# without first converting to a character variable
# from the default factor variable
date_field <- as.character(include_list$Date)
str(date_field)

new_date <- as.Date(date_field, "%m/%d/%Y")
#new_date <- as.Date(date_field, "%Y-%d-%m")
#new_date <- as.Date(date_field, "%Y/%d/%m")
str(new_date)

# Now overwrite the contents of the date field with new date structure
include_list$Date = new_date
str(include_list)
structure(include_list)
  
# We will also recode age 'NA' to Elder
include_list$AgeCat[include_list$Age >= 45] <- "Elder"
include_list$AgeCat[include_list$Age >= 26 & include_list$Age <= 44] <- "Middle Aged"
include_list$AgeCat[include_list$Age <= 25] <- "Young"
include_list$AgeCat[is.na(include_list$Age)] <- "Elder"

structure(include_list)

manager_converted_date <- as.Date(managers$Date, "%Y-%d-%m")
str(manager_converted_date)
managers$Date <- manager_converted_date

# Add summary_col to the end of the data frame
include_list <- data.frame(new_managers_data, summary_col)

# Calculate mean value for each row
mean_value <- rowMeans(include_list[8:12])

# Add mean_value to end of managers data frame
include_list <- data.frame(include_list, mean_value)

str(new_managers_data)


include_list$
  
new_managers_data([])
#merge datasets

rbind(managers, new_managers_data)
