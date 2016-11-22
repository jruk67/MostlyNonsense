setwd("C:/Users/Jaryan/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")

require(xlsx)

Actual_PCard_Data <- read.xlsx("Darcy Davenport P09-16 US PCard Backup Corp - ACTUALS.xls", sheetIndex = 1)
Forecast_PCard_Data <- read.xlsx("Darcy Davenport P09-16 US PCard Backup Corp - FORECAST.xls", sheetIndex = 1)

Filter_Actual <- filter(Actual_PCard_Data, Area %in% c("90303", "90309", "90159"))
Filter_Forecast <- filter(Forecast_PCard_Data, Area %in% c("90303", "90309", "90159"))

Actual_Subset <- Filter_Actual[,c("Employee.Name", "Merchant.Name", "Status", "Trans.Amount", "Legal.Entity", "Division", "Account", "Department", "Area", "Merch.Area")] %>%
Forecast_Subset <- Filter_Forecast[,c("Employee.Name", "Merchant.Name", "Status", "Trans.Amount", "Legal.Entity", "Division", "Account", "Department", "Area", "Merch.Area")] %>%

# View(Second_Open_PO_Report)

write.xlsx("C:/Users/Jaryan/Gap R Project/Data/PCard Report.xlsx")