setwd("I:/James/Gap R Project/Data/CSV")
options(sqldf.driver = "SQLite")

FDC_Open_PO_Data <- read.csv("Open_PO_90303.csv",
                       stringsAsFactors=FALSE, sep=",")
PDC_Open_PO_Data <- read.csv("Open_PO_90309.csv",
                       stringsAsFactors=FALSE, sep=",")
WFC_Open_PO_Data <- read.csv("Open_PO_90159.csv",
                       stringsAsFactors=FALSE, sep=",")

names(FDC_Open_PO_Data)[3] <- c("Document.Type")
names(PDC_Open_PO_Data)[3] <- c("Document.Type")
names(WFC_Open_PO_Data)[3] <- c("Document.Type")

Filter_FDC <- filter(FDC_Open_PO_Data, Requestor %in% c("Sim, Lynnette Mae", "Lamanuzzi, Bruce", "Barr, Lisa"), Closed.Code %in% c("APPROVED", "CLOSED FOR RECEIVING", "OPEN", "PRE-APPROVED"), Matching.Date < 1, Department != '7174', !Account %in% c("1435", "1437"))
Filter_PDC <- filter(PDC_Open_PO_Data, Requestor %in% c("Sim, Lynnette Mae", "Lamanuzzi, Bruce", "Barr, Lisa"), Closed.Code %in% c("APPROVED", "CLOSED FOR RECEIVING", "OPEN", "PRE-APPROVED"), Matching.Date < 1, Department != '7174', !Account %in% c("1435", "1437"))
Filter_WFC <- filter(WFC_Open_PO_Data, Requestor %in% c("Sim, Lynnette Mae", "Lamanuzzi, Bruce", "Barr, Lisa"), Closed.Code %in% c("APPROVED", "CLOSED FOR RECEIVING", "OPEN", "PRE-APPROVED"), Matching.Date < 1, Department != '7174', !Account %in% c("1435", "1437"))

FDC_Open_PO_Data_Subset <- Filter_FDC[,c("Document.Type", "Po.Open.Date", "Po.Number", "Requestor", "Supplier", "Item.Description", "Total.Po.Amount", "Charge.Account", "Area")]
PDC_Open_PO_Data_Subset <- Filter_PDC[,c("Document.Type", "Po.Open.Date", "Po.Number", "Requestor", "Supplier", "Item.Description", "Total.Po.Amount", "Charge.Account", "Area")]
WFC_Open_PO_Data_Subset <- Filter_WFC[,c("Document.Type", "Po.Open.Date", "Po.Number", "Requestor", "Supplier", "Item.Description", "Total.Po.Amount", "Charge.Account", "Area")]

Final_Open_PO_Report = rbind(FDC_Open_PO_Data_Subset, PDC_Open_PO_Data_Subset, WFC_Open_PO_Data_Subset) %>%

# View(Second_Open_PO_Report)
                                        
write.csv("I:/James/Gap R Project/Data/Open PO Report.csv")