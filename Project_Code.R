
# Data input
my_data <- read.csv("Plasma lipidomics in Alzheimers disease and its progression-1.csv")
View(my_data)

# Data cleaning
my_data_2 <- my_data[ , c(1:9)]
View(my_data_2)

my_data_2[my_data_2== ""] <- NA
View(my_data_2)

my_data_3 <- na.omit(my_data_2)
View(my_data_3)

# Data visualization
library(ggplot2)

# Boxplot
ggplot(data = my_data_3, aes(x= my_data_3$Diagnostic, y= my_data_3$Age, 
                             fill= my_data_3$Sex)) +
  labs( x= "Diagnostic", y= "Age", fill= "Gender", 
        title= "Age and Gender Distribution in AD and MCI Patients") +
  geom_boxplot() +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Histogram
ggplot(data = my_data_3, aes(x = my_data_3$CSF.Amyloid..pg.mL. , fill = my_data_3$Diagnostic )) +
  labs( x= "CSF Amyloid (pg/mL)", y= "Frequency", fill= "Diagnostic", 
        title= "Comparison of CSF Amyloid Concentration between AD and MCI Patients") +
  geom_histogram() +
  facet_wrap(~Diagnostic) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Grouped Barplot
ggplot(data = my_data_3, aes(x= my_data_3$Diagnostic, fill= my_data_3$APOE4)) +
  labs( x= "Diagnostic", y= "Frequency", fill= "APOE4", 
        title= "Presence of APOE4 Allele in AD and MCI Patients") +
  geom_bar(position= "dodge") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Scatterplot
ggplot(data = my_data_3, aes(x= my_data_3$CSF.Phosphorylated.tau..pg.mL. , 
                             y= my_data_3$CSF.Total.tau..pg.mL. , 
                             col=my_data_3$Diagnostic)) + 
  labs( x= "CSF Total tau (pg/mL)", y= "CSF Phosphorylated tau (pg/mL)",
        col= "Diagnostic",
        title= "Comparison of CSF Total Tau Protein and Phosphorylated Tau Protein Concentration\n between AD and MCI Patients") +
  geom_point() +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
