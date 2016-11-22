setwd("I:/James/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Raw_Journal_Data <- read.csv("Journal_Data.csv")

names(Raw_Journal_Data) <- c("Period_Name",	
                         "Set_of_Books",
                         "LE",
                         "LE_Description",
                         "Div",
                         "Div_Description",
                         "Account_Number",
                         "Acct_Description",
                         "Department_Number",
                         "Dept_Description",
                         "Area",
                         "Area_Description",
                         "Merch",
                         "Merch_Description",
                         "Trans_Curr",
                         "Trans_Amt_Dr",
                         "Trans_Amt_Cr",
                         "Func_Curr",
                         "Func_Amt_Dr",
                         "Func_Amt_Cr",
                         "Posting_Status",
                         "Approval_Status",
                         "Journal_Name",
                         "JV_Description",
                         "JV_Line_Description",
                         "JV_Source_ID",
                         "JV_Source_Name",
                         "JV_Category",
                         "JV_Date",
                         "JV_Line_No",
                         "Operator_Name",
                         "Legacy_Account/RCN",
                         "Legacy_Account",
                         "Legacy_RCN",
                         "Type_of_Entry",
                         "Rate_Type",
                         "Conv_Date",
                         "Rate_Multiplier",
                         "Rev_Status",
                         "Reversal_Date",
                         "Reference_1",
                         "Reference_2",
                         "Reference_3",
                         "Journal_Posted_Date",
                         "LES") 

filter_string <- "select
                Raw_Journal_Data.Func_Amt_Dr
              , Raw_Journal_Data.Func_Amt_Cr
              , Raw_Journal_Data.Journal_Name
              , Raw_Journal_Data.Period_Name
              , Raw_Journal_Data.Account_Number
              , Raw_Journal_Data.Acct_Description
              , Raw_Journal_Data.Department_Number
              , Raw_Journal_Data.Area
                from Raw_Journal_Data
                where Raw_Journal_Data.Account_Number between '5000' and '6199'
                and Raw_Journal_Data.Department_Number not in ('7352', '2550', '1201', '2503', '2588','5529')"

Scrubbed_Journal_Data <- sqldf(filter_string,stringsAsFactors = FALSE) %>%
  
# View(Scrubbed_Journal_Data)
  
write.csv("I:/James/Gap R Project/Data/Scrubbed Journal Data.csv")
