# Description of run_analysis.R 

run_analysis.R starts checking if the needed packages are already installed. If not, it automatically downloads and installs them.

Then it downloads and reads all the data in separate tables. Data from test and train sets are binded togheter using rbind() and cbind(), then the variables are renamed with colnames().  Using merge(){dplyr}, it updates the "Activity" column. Using select(){dplyr}, it subsets the database, extracting the columns which contains the word mean or std (the selection isn't case sensitive). The result is a tidy data set, as requested.

Then it performs a multivariable grouping (by activity and then by subject ID) and, using summarize_each(), it computes the mean value of each columns. The result is the secondd tidy data set requested.

At the end, both the data sets are saved in the working directory as .RDS files.
