setwd("C:/Users/Jaryan/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Journal_Data <- read.csv("Journal_Data.csv")
AP_Data <- read.csv("AP_Data.csv")

names(Journal_Data) <- c("Period_Name",	
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

names(AP_Data) <- c("Period_Name",
                    "Account_Number",
                    "Account_Description",
                    "Department_Number",
                    "Area",
                    "Vendor_Name",
                    "Invoice_Number",
                    "Invoice_Amount")

join_string <- "select distinct
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
                 join AP_Data
                 on Journal_Data.Period_Name = AP_Data.Period_Name
               where AP_Data.Account_Number between '5000' and '6199'
               and AP_Data.Department_Number not in ('7352', '2550')"

Journal_Data_join_AP_Data <- sqldf(join_string,stringsAsFactors = FALSE) %>%

# View(Journal_Data_join_AP_Data)

write.csv("C:/Users/Jaryan/Gap R Project/Data/Live MER.csv")
