setwd("I:/James/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Raw_AP_Data <- read.csv("AP_Data.csv")

names(Raw_AP_Data) <- c("Period_Name",
                    "Account_Number",
                    "Account_Description",
                    "Department_Number",
                    "Area",
                    "Vendor_Name",
                    "Invoice_Number",
                    "Invoice_Amount")

filter_string <- "select
                 Raw_AP_Data.Period_Name
               , Raw_AP_Data.Account_Number
               , Raw_AP_Data.Account_Description
               , Raw_AP_Data.Department_Number
               , Raw_AP_Data.Area
               , Raw_AP_Data.Vendor_name
               , Raw_AP_Data.Invoice_Number
               , Raw_AP_Data.Invoice_Amount
                 from Raw_AP_Data
                 where Raw_AP_Data.Account_Number between '5000' and '6199'
                 and Raw_AP_Data.Department_Number not in ('7352', '2550', '1201', '2503', '2588','5529')"

Scrubbed_AP_Data <- sqldf(filter_string,stringsAsFactors = FALSE) %>%
  
# View(Scrubbed_AP_Data)
  
write.csv("I:/James/Gap R Project/Data/Scrubbed AP Data.csv")
