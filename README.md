#What's in this repo?

This repo contains the files submitted for the final exam of Jan 2016 "Getting and Cleaning Data" course.
Along with the present README, you will find a CODEBOOK describing how the "run_analysis.R" script works and what variables were taken in account, the script itself and its output file in .txt format.

The analysis was perfomered on version 1.0 of the public dataset "Activity Recognition Using Smartphones". 
run_analysis.R is a simple script that downloads and reads the original dataset, merges the train and test data, updates the variables' names to make them easier to understand and then creates a new dataset containing only mean measurements and their standard deviations. Then it computes the mean value for each variable and saves them in a different dataset.


For further details about the original dataset, please contact the authors of the study:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
