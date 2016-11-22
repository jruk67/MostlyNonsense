setwd("I:/James/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")

FDC_Journal_Data <- read.csv("90303.csv",
                             stringsAsFactors=FALSE, sep=",")
PDC_Journal_Data <- read.csv("90309.csv",
                             stringsAsFactors=FALSE, sep=",")
WFC_Journal_Data <- read.csv("90159.csv",
                             stringsAsFactors=FALSE, sep=",")

Final_Journal_Report = rbind(FDC_Journal_Data, PDC_Journal_Data, WFC_Journal_Data) %>%

# View(Final_Journal_Report)

write.csv("I:/James/Gap R Project/Data/Final Journal Report.csv")
