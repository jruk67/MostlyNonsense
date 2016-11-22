setwd("C:/Users/Jaryan/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Raw_AP_Data <- read.csv("AP_Data.csv")
Raw_Accrual_Data <- read.csv("Accruals.csv")

names(Raw_AP_Data) <- c("Period_Name",
                    "Account_Number",
                    "Account_Description",
                    "Department_Number",
                    "Area",
                    "Vendor_Name",
                    "Invoice_Number",
                    "Invoice_Amount")

filter_string <- "select distinct
                 Raw_AP_Data.Period_Name
               , Raw_AP_Data.Account_Number
               , Raw_AP_Data.Account_Description
               , Raw_AP_Data.Department_Number
               , Raw_AP_Data.Area
               , Raw_AP_Data.Vendor_name
               , Raw_AP_Data.Invoice_Number
               , Raw_AP_Data.Invoice_Amount
                 from Raw_AP_Data
                 inner join Raw_Accrual_Data
                 on Raw_AP_Data.Area = Raw_Accrual_Data.AREA
                 and Raw_AP_Data.Department_Number = Raw_Accrual_Data.DEPT
                 and Raw_AP_Data.Account_Number = Raw_Accrual_Data.ACCT
                 where Raw_AP_Data.Account_Number between '5000' and '6199'
                 and Raw_AP_Data.Department_Number not in ('7352', '2550', '1201', '2503', '2588','5529')
                 and Raw_Accrual_Data.TYPE LIKE ('%ACCRUAL%')"

Accrued_Data <- sqldf(filter_string,stringsAsFactors = FALSE) %>%
  
# View(Accrued_Data)
  
write.csv("C:/Users/Jaryan/Gap R Project/Data/Accrued Data.csv")
