setwd("I:/James/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")
Open_PO_Data <- read.xlsx("Open PO Report Master.xlsx", sheet=2)

filter_string <- "select *
                  from Open_PO_Data
                  where Open_PO_Data.Status LIKE ('%Open%')"

Open_PO_to_be_Accrued_Data <- sqldf(filter_string,stringsAsFactors = FALSE)

One_Two_Electric_Boogaloo <- cSplit(Open_PO_to_be_Accrued_Data, 'Charge.Account', '.', drop = TRUE)

colnames(One_Two_Electric_Boogaloo) <- c("PO_Open_Date", "PO_Number", "Supplier", "Decription",
                                       "Amount", "Status", "Legal_Entity", "Division", "Account",
                                       "Department", "Area", "MERCH", "CURR_IU", "Future_Use")

subset(One_Two_Electric_Boogaloo,select=c(6,1,7:14,5,2:4)) %>%
  
# One_Two_Electric_Boogaloo[rep(1:nrow(One_Two_Electric_Boogaloo),each = 2),]

# View(subset(One_Two_Electric_Boogaloo,select=c(6,1,7:14,2:4)))

write.csv("I:/James/Gap R Project/Data/Open PO's to be Accrued.csv", row.names = FALSE)