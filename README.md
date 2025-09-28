# Bellabeat Smart Device Analysis

## 📌 Project Summary
This project analyzes smart device usage data to uncover insights about user activity, sleep, and wellness patterns.  
The goal is to support **Bellabeat**, a health-focused company, in identifying opportunities to enhance their product offerings.  
By combining exploratory data analysis, visualization, and business context, the project demonstrates how data can guide smart business decisions.

## 📦 Project Structure
bellabeat-smart-device-analysis/
├── bellabeat_analysis_clean.R # Clean R code
├── how-can-a-wellness-company-play-it-smart.ipynb # Full notebook
├── install_packages.R # Dependencies
├── README.md # Project overview
└── visuals/ # Exported charts

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

1. **Active Minutes vs Calories Burned**  
   Shows a positive correlation between active minutes and calories burned.  
   ![Active Minutes vs Calories](visuals/active_minutes_vs_calories.png)

2. **Calories vs Steps**  
   Illustrates how total steps relate to daily calorie expenditure.  
   ![Calories vs Steps](visuals/calories_vs_steps.png)

3. **Average Intensity by Time of Day**  
   Highlights peak activity periods throughout the day.  
   ![Average Intensity by Time of Day](visuals/avg_intensity_by_time.png)

4. **Activity Intensity Categories**  
   Comparison of time spent in lightly, fairly, and very active minutes.  
   ![Activity Intensity Categories](visuals/activity_minutes_boxplot.png)


## 🚀 How to Run
1. Install required packages:
   ```r
   source("install_packages.R")
2. Run the analysis:

source("bellabeat_analysis_clean.R")









