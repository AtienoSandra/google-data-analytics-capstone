# Bellabeat Smart Device Analysis

## 📌 Project Summary
This project analyzes smart device usage data to uncover insights about user activity, sleep, and wellness patterns.  
The goal is to support **Bellabeat**, a health-focused company, in identifying opportunities to enhance their product offerings.  
By combining exploratory data analysis, visualization, and business context, the project demonstrates how data can guide smart business decisions.

🔗 Quick links:  
- [R Script](bellabeat_analysis_clean.R)  - provides a clean, reproducible version of the analysis.
- [Notebook](how-can-a-wellness-company-play-it-smart.ipynb)  - contains a detailed walk-through with code, explanations, and outputs.
- [Dependencies](install_packages.R)  - the required R packages

## 🔑 Key Insights
These findings highlight potential opportunities for **Bellabeat** to design product features that encourage healthier daily habits and improve overall wellness outcomes.
- Users tend to fall short of the **recommended daily activity** levels.  
- **Sleep patterns** vary widely, with many users not achieving consistent rest.  
- Higher activity does not always translate to **better sleep quality**.  

## 🔑 Key Visualizations
<img width="700" height="500" alt="Image" src="https://github.com/user-attachments/assets/3e5b17b7-219c-412d-935f-59b406f1244b" />

<img width="700" height="500" alt="Image" src="https://github.com/user-attachments/assets/a3c90d1f-96c1-4a43-a4bd-e024a1ce80d8" />

<img width="700" height="500" alt="Image" src="https://github.com/user-attachments/assets/48be28e7-a861-483f-b43f-aa1deabc93bf" />

<img width="700" height="500" alt="Image" src="https://github.com/user-attachments/assets/e29a5852-e002-4261-959b-70796a597ddc" />

## 🚀 How to Run
1. Install required packages:
   ```r
   source("install_packages.R")
2. Run the analysis:

source("bellabeat_analysis_clean.R")


### Introduction
Bellabeat a high-tech manufacturer of health-focused products for women is looking to unlock new growth opportunities in the global smart device market. Their product portfolio includes devices: Leaf, Ivy, and Time which can track health data namely hydration, heart rate, menstrual cycle, sleep, and physical activity. The business task in this case is to use competitor data to reveal user trends in the smart device market. These findings will then offer insights into growth areas Bellabeat can tap into.

### Key Stakeholders
Urška Sršen - Bellabeat co-founder and Chief Creative Officer
Sando Mur - Bellabeat co-founder and key member of the Bellabeat executive team
Bellabeat Marketing Analytics Team
Objective
In this case study my goal is to analyze the data using R and discover insights into the following questions :

### What is the activity level of FitBit users?
How much sleep do the users get?
How does daily activity impact Fitbit users' sleep?
At which period do the users record the most and least activity?
Data Source
We will use data from Fitbit Fitness Tracker (Bellabeat’s competitor) available on Kaggle. The datasets were originally sourced from a survey which in turn was performed on Amazon Mechanical Turk workers for a research study, that collected Fitbit tracking data. The dataset contains 18 tables with data from about 30 users collected from 12th April 2016 to 12th May 2016.

### Datasets to be used in this case study:
dailyActivity_merged.csv
hourlyIntensities_merged.csv
hourlySteps_merged.csv
sleepDay_merged.csv

### Analysis
From the bar plot, we can observe two distinct periods during the day where the mean total intensities rise: between 12 to 2 PM and between 5 to 7 PM. The peak between 12 and 2 PM is likely due to activities such as lunch breaks where individuals may engage in short walks to their lunch spots, favorite fruit and juice blend vendors or just stretch after sitting for long hours before resuming work at 2 pm. The peak between 5 and 7 PM is probably because many people leave work and are headed home covering various distances to catch a bus or this is the time most go to the gym before heading home and relaxing in the night.

From the histogram, we can say that the total active minutes is normally distributed with the majority of Fitbit users spending between 250 minutes to 300 minutes per activity.

There is a moderate relationship between total active minutes and calories burned(r=0.39). By increasing total active minutes, Fitbit users may be able to increase total calorie burn. Total active minutes can be increased by taking more daily steps as it positively affects calories burned too(r=0.5)

Based on the box and whisker plot, the majority of Fitbit users spend most of their active time in the “lightly active” range.

There is no correlation between Total calories burned and time spent sleeping as seen from the plot.

This may be attributed to the fact that the majority of the Fitbit users engaged in light-intensity activities, or they had definite sleep and wake pattern windows, or due to the small dataset of participants hence not getting the true picture. Upon further interrogation of the data, I discovered that indeed 54% of the Fitbit users did not get the recommended amount of sleep.

### Conclusion
Higher intensity and higher levels of activity have a positive correlation to burned calories. Most users have a sedentary lifestyle with light intensity workouts. Therefore, most participants don’t get enough sleep.

#### Recommendations
Bellabeat could incorporate an alert system like vibration on the watch or a notification on the app to alert the smart device users to take a moment and walk or step away from their desk for a few minutes and walk or stretch.

Bellabeat can also introduce a feature that allows users to synchronize their apps and calendars. This way, the app sends bed time notifications 30 minutes before bed time to allow users to wind down and prepare for sleep. That way they will get the recommended sleep of at least 7 hours per day.









