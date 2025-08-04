#creating subfolders
dir.create("script")
dir.create("results")
dir.create("data")
dir.create("clean_data folder")
#reading patient file and assigning as variable
data=read.csv(file.choose())
View(data)
str(data)
#data wrangling
#convert gender into factor
data$gender_fac=as.factor(data$gender)
#converting gender factor into numerical
data$gender_fac_num=ifelse(data$gender_fac == "Male", 1,0)
#convert diagnosis into factor
data$disease_state=as.factor(data$diagnosis)
#converting disease_state factor into numerical
data$disease_state_num=ifelse(data$disease_state == "Cancer", 1,0)
#convert smoker into factor
data$smoking_satus=as.factor(data$smoker)
#converting smoking_satus factor into numerical
data$smoking_satus_num=ifelse(data$smoking_satus== "Yes",1,0)
str(data)
# Add BMI group as a new factor column
data$bmi_fac = cut(data$bmi,
                   breaks = c(-Inf, 18.5, 24.9, Inf),
                   labels = c("Underweight", "Normal", "Overweight")
)
mean_age=mean(data$age)
mean_bmi=mean(data$bmi)
#Visualisation
#Barplot of ages
barplot(data$age)
#Histogram of BMI
hist(data$bmi)
#Saving data as csv
write.csv(data, file="clean_data folder/patient_info_clean.csv")
