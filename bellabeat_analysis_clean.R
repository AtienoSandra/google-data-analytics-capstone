
library(tidyverse) # metapackage of all tidyverse packages

# ----



# ----

# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using "Save & Run All" 
# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session

# ----

# Load necessary libraries
library(tidyverse)
library(lubridate)
library(dplyr)
library(tidyr)
library(ggplot2)

# ----

# Import and take a look at the relevant datasets  
daily_Activity <- read.csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")
sleep_Day <- read.csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")
weight_Log <- read.csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv")
hourly_Intensities <- read.csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/hourlyIntensities_merged.csv")
hourly_Steps <- read.csv("/kaggle/input/fitbit/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv")

# ----

head(daily_Activity)
head(sleep_Day)
head(weight_Log)
head(hourly_Intensities)
head(hourly_Steps)

# ----

colnames(daily_Activity)
colnames(sleep_Day)
colnames(weight_Log)
colnames(hourly_Intensities)
colnames(hourly_Steps)

# ----

# number of participants in each dataset
n_distinct(daily_Activity$Id) #33
n_distinct(sleep_Day$Id) #24
n_distinct(weight_Log$Id)#8, contains very few participants hence can't be used
                        #hence deleted
n_distinct(hourly_Intensities$Id) #33
n_distinct(hourly_Steps$Id) #33

# ----

# convert date columns to Date and Time format
daily_activity_new<-daily_Activity%>%
  mutate(ActivityDate = as.Date(ActivityDate, format = "%m/%d/%Y"))%>%
  rename(Date = ActivityDate)
View(daily_activity_new)

# ----

sleep_day_new<-sleep_Day%>%
  mutate(SleepDay = as.Date(SleepDay, format = "%m/%d/%Y %I:%M:%S %p"))%>%
  rename(Date = SleepDay)
View(sleep_day_new)

# ----

hourly_intensities_new <- hourly_Intensities %>%
  mutate(ActivityHour = as.POSIXct(ActivityHour, format = "%m/%d/%Y %I:%M:%S %p"),
         Date = as.Date(ActivityHour),
         Time = format(ActivityHour, format = "%H:%M:%S")) %>%
  select(-ActivityHour)
View(hourly_intensities_new)

# ----

hourly_steps_new <- hourly_Steps %>%
  mutate(ActivityHour = as.POSIXct(ActivityHour, format = "%m/%d/%Y %I:%M:%S %p"),
         Date = as.Date(ActivityHour),
         Time = format(ActivityHour, format = "%H:%M:%S")) %>%
  select(-ActivityHour)
View(hourly_steps_new)

# ----

# check for and drop duplicates and NA in the new dataframes
sum(duplicated(daily_activity_new))
sum(duplicated(sleep_day_new)) #sleep_day_new has 3 duplicates that need to be dropped
sum(duplicated(hourly_intensities_new))
sum(duplicated(hourly_steps_new))
sleep_day_new<-sleep_day_new%>%distinct()%>%drop_na()
daily_activity_new<-daily_activity_new%>%drop_na()
hourly_intensities_new<-hourly_intensities_new%>%drop_na()
n_distinct(daily_activity_new$Id)
n_distinct(sleep_day_new$Id)
n_distinct(hourly_intensities_new$Id)
n_distinct(hourly_steps_new$Id)

# ----

#merge dataframes for analysis
daily_activity_sleep_df <- merge(daily_activity_new,sleep_day_new,by=c("Id","Date"))
daily_activity_sleep_df <- daily_activity_sleep_df%>%drop_na()
n_distinct(daily_activity_sleep_df$Id)
head(daily_activity_sleep_df)
#Summary STATS on daily_activity_sleep
activity_sleep_df <- daily_activity_sleep_df %>% 
  mutate(TotalActiveMins = LightlyActiveMinutes+FairlyActiveMinutes+VeryActiveMinutes)

# ----

mean_activity_sleep <- activity_sleep_df %>%
  group_by(Id) %>%
  summarise('AVG_total_steps' = mean(TotalSteps), 
            'AVG_daily_sleep' = mean(TotalMinutesAsleep),
            'AVG_daily_cal' = mean(Calories),
            'AVG_very_active_min' = mean(VeryActiveMinutes),
            'AVG_fairly_active_min' = mean(FairlyActiveMinutes),
            'AVG_lightly_active_min' = mean(LightlyActiveMinutes),
            'AVG_sedentary_min' = mean(SedentaryMinutes))

# ----

#Histogram of Total Active Minutes 
hist(activity_sleep_df$TotalActiveMins, col = "purple", main = "Total Active Minutes Distribution", xlab = "Minutes", xlim = c(0,500))

# ----

#Active Minutes vs Calories Burned
cor_min_cal <- cor(activity_sleep_df$TotalActiveMins, activity_sleep_df$Calories) #correlation coeeficient
cor_min_cal_text <- paste("Correlation: ",round(cor_min_cal,2))

# ----

ggplot(data = activity_sleep_df, aes(x = TotalActiveMins, y = Calories))+
  geom_point(col = "purple")+
  geom_smooth(method = "lm", color = "black")+
  labs(title = "Total Active Minutes vs Calories", x = "Total Active Minutes", y = "Calories")+
  annotate("text", x = Inf, y = Inf, label = cor_min_cal_text, hjust = 1.1, vjust = 1.5, size = 4, color = "red")

# ----

#Total Steps vs Daily Calories
cor_cal_steps <- cor(daily_activity_new$Calories, daily_activity_new$TotalSteps)
cor_cal_steps_text <- paste("Correlation: ",round(cor_cal_steps,2))
ggplot(daily_activity_new, aes(x = TotalSteps, y = Calories))+
  geom_point(color = "purple")+
  geom_smooth(method = "lm", color= "black")+
  labs(title = "Daily Calories vs Total Steps", x = "Steps", y = "Calories")+
  annotate("text", x = Inf, y = Inf, label = cor_cal_steps_text, hjust = 1.1, vjust = 1.5, size = 4, color = "red")
#Total minutes asleep vs Burned Calories
cal_sleep <- cor(activity_sleep_df$Calories, activity_sleep_df$TotalMinutesAsleep)
cal_sleep_text <- paste("Correlation: ",round(cal_sleep,2))
ggplot(activity_sleep_df,aes(x=Calories, y=TotalMinutesAsleep)) + geom_point(color="purple") +
  geom_smooth(method="lm", col = "black") + labs(title = "Burned Calories vs. Total Minutes Asleep",
                                                 x = "Burned Calories", y = "Total Minutes Asleep") +
  theme(plot.title = element_text(size = 10))+
  annotate("text", x = Inf, y = Inf, label = cal_sleep_text, hjust = 1.1, vjust = 1.5, size = 4, color = "red")

# ----

#Average Total Intensity during the day
hourly_intensity_mean <- hourly_intensities_new %>%
  group_by(Time) %>%
  summarise(MeanTotalIntensity = mean(TotalIntensity))

# ----

ggplot(hourly_intensity_mean, aes(x = Time, y = MeanTotalIntensity)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(title = "Average Total Intensity by Time of the Day",
       x = "Time of Day",
       y = "Average Total Intensity") +
  theme(plot.title = element_text(size = 10))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 6, ))

# ----

#intensity categories and how much time fit bit users spend in each
boxplot(activity_sleep_df$LightlyActiveMinutes, activity_sleep_df$FairlyActiveMinutes, 
        activity_sleep_df$VeryActiveMinutes, col = c("lightblue", "yellow", "green"), xlab = "Activity Intensity",
        ylab = "Minutes", main = "Light, Fair, and Very Active Minutes", names = c("Light","Fair","Very"))

# ----

#Did Fitbit users get enough sleep
recommended_sleep <- mean_activity_sleep %>%
  mutate('rec_sleep_reached' = case_when(
    AVG_daily_sleep >= 420 ~ 'Yes',
    AVG_daily_sleep < 420 ~ 'No'))
#Calculate how many users got the recommended amount of sleep
recommended_sleep %>%
  group_by(rec_sleep_reached) %>%
  summarise(total = n()) %>%
  mutate(totals = sum(total)) %>%
  group_by(rec_sleep_reached) %>%
  summarise(total_percent = total/totals *100)
  