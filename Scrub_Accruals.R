setwd("I:/James/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Raw_Accrual_Data <- read.csv("Accruals.csv")

filter_string <- "select
                  Raw_Accrual_Data.DATE
                , Raw_Accrual_Data.LE || ' ' || Raw_Accrual_Data.DIV || ' ' || Raw_Accrual_Data.ACCT || ' ' || Raw_Accrual_Data.DEPT || ' ' || Raw_Accrual_Data.AREA || ' ' || '0000' || ' ' || '000' || ' ' || '0000' as ACCT_STRING
                , Raw_Accrual_Data.DEBIT
                , Raw_Accrual_Data.CREDIT
                , Raw_Accrual_Data.DESC
                  from Raw_Accrual_Data
                  where Raw_Accrual_Data.TYPE LIKE ('%ACCRUAL%')
                  and Raw_Accrual_Data.DESC LIKE ('%PO%')"

Accrued_Data <- sqldf(filter_string,stringsAsFactors = FALSE)

Get_That_Wiley_Ol__PO <- cSplit(Accrued_Data, 'DESC', '#', drop=TRUE) %>%

# View(Accrued_Data)
  
write.csv("I:/James/Gap R Project/Data/Accrued Data.csv")
