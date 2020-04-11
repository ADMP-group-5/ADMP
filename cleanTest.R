# Install packages
library(dplyr)
install.packages(c("boot", "class", "foreign", "lattice", "MASS", "nlme", "nnet", "survival"))
library(readxl)
library(readr)
###########################################################################
###########################################################################
# remove variables 
rm(population, childcare, childcare2, housing)

###########################################################################
###########################################################################

# Import dataset for ADMP, specify range and give appropriate name 
population <- read_csv("~/Dropbox/ADM Group Assessment/The Development/Structed Data/Population 2.0.csv")
#childcare <- read_excel("~/Dropbox/ADM Group Assessment/The Development/Education_Childcare_dataset_as_at_31_March_2018_new (version 1).xlsx", sheet = "Childcare_providers")
childcare <- read_excel("~/Dropbox/ADM Group Assessment/The Development/Education_Childcare_dataset_as_at_31_March_2018_new (version 1).xlsx",sheet = "Childcare_providers", col_types = c("text","text", "text", "text", "date", "text","text", "text", "text", "text", "text","text", "text", "text", "text", "text","text", "text", "text", "text", "text","numeric", "text", "text", "text","text", "text", "text", "text", "text","text", "text", "text", "text", "text","text", "text", "text", "text"))
childcare2 <- read_csv("~/Dropbox/ADM Group Assessment/The Development/Structed Data/facilities.csv")
housing <- read_csv("~/Dropbox/ADM Group Assessment/The Development/Structed Data/housing.csv")

###########################################################################
###########################################################################

# 1) rename specific columns 
# 
# 2) convert Excel numeric date data to correct date format in R
# 
# 3) to quickly find and remove data that has wrong dates
# 
# 4) to backup and store any rows that will be updated or removed.
# 
# 5) to identify, edit and / or remove null or missing data.
# 
# 6) to identify and remove garbage data.
# 
# 7) then we will make some quick and easy insights in the end that you will find interesting on this dataset.
# 

###########################################################################
###########################################################################
#cleaning childcare dataset
#2) convert Excel numeric date data to correct date format in R
childcare$`Registration date` <- as.Date(childcare$`Registration date`, origin = "1899-12-30")
#change column format
childcare$`Registration date` <- format(as.Date(childcare$`Registration date`), "%d/%m/%Y")
#remove unwanted rows

# Filter new view example 
childcare %>% filter(`Provider type`== 'Childminder', `Provider URN` == 'EY554606')

