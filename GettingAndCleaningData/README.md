This is the readme for the peer assessment of the Coursera course "Getting and Cleaning data".

To run the script, make sure that Data is unzipped tp your working directory. You than the following directory:
"UCI HAR Dataset/...."

The code itself first scans all the provided datafiles. 
Afterwards the columns and the labeling of the activities are adjusted.

Then the two columns for the activity and the subject ID are added.

Next step is to extract the right data (mean() or std()) from the data sets.

Afterwards the two required tidy datasets are created.

The result is written to your working directory as a file called "tidy_data.txt" of type csv.