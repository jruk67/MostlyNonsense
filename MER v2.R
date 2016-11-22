setwd("C:/Users/Jaryan/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Journal_Data <- read.csv("Journal_Data.csv")
AP_Data <- read.csv("AP_Data.csv")

join_string <- "select
                 Journal_Data.Func_Amt_Dr
               , Journal_Data.Func_Amt_Cr
               , Journal_Data.Journal_Name
               , AP_Data.Period_Name
               , AP_Data.Account_Number
               , AP_Data.Account_Description
               , AP_Data.Department_Number
               , AP_Data.Area
               , AP_Data.Vendor_name
               , AP_Data.Invoice_Number
               , AP_Data.Invoice_Amount
               from Journal_Data
                 left join AP_Data
                 on Journal_Data.Period_Name = AP_Data.Period_Name"
                 
Journal_Data_join_AP_Data <- sqldf(join_string,stringsAsFactors = FALSE)

View(Journal_Data_join_AP_Data)

write.xlsx("C:/Users/Jaryan/Gap R Project/Data/Live MER.xlsx")
