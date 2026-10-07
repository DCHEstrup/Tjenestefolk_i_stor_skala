library("tidyverse")
Folketælling1834 <- read_csv("census_1834__v1__cl.csv")
Hammer_1834 <- Folketælling1834 %>%
  filter(Sogn == "Hammer")
Ulrup <- Hammer_1834 %>%
  filter(Stednavn == "Ulrup")


#install.packages("writexl")
library(writexl)
write_xlsx(Ulrup, "Attrup.xlsx")


vadum <- Folketælling1834 %>%
  filter(Sogn == "Vadum")
write_xlsx(vadum, "vadum.xlsx")

farum<-Folketælling1834 %>%
  filter(Sogn == "Farum")
summary(farum$Stednavn)
summarize(farum$Stednavn)
sum(farum$Stednavn)

Væreløse <- Folketælling1834 %>%
  filter(Sogn == "Værløse")
Farumgaard <- farum %>% 
  filter(Matr_nr_adresse=="Farumgaard")
write_xlsx(farum, "farum.xlsx")
Lunde <- Folketælling1834 %>% 
  filter(Sogn =="Lunde")


write_xlsx(Lunde, "Lunde.xlsx")

Allerslev <- Folketælling1834 %>% 
  filter(Sogn == "Allerslev")
Allerslev2 <- Allerslev %>% 
  filter(Amt=="Præstø")
Hammer <- Folketælling1834 %>% 
  filter(Sogn=="Hammer")
Hammer2 <- Hammer %>% 
  filter(Amt=="Skanderborg")
write_xlsx(Hammer2, "Hammer.xlsx")
Hvidbjerg <- Folketælling1834 %>%  
  filter(Sogn == "Hvidbjerg")
Hvidbjerg2 <- Hvidbjerg %>%  
  filter(Herred == "Refs")
write_xlsx(Hvidbjerg2, "Hvidbjerg.xlsx")
Helsinge <- Folketælling1834 %>% 
  filter(Herred=="Løve")
Helsinge2 <- Helsinge %>% 
  filter(Sogn=="Kirke Helsinge")
Helsinge3 <- Helsinge2 %>% 
  filter(Stednavn=="Kirkehelsinge Bye")
Henne <- Folketælling1834 %>% 
  filter(Sogn=="Henne")
write_xlsx(Henne,"Henne.xlsx")

Brabrand <- Folketælling1834 %>% 
  filter(Sogn=="Brabrand")
write_xlsx(Brabrand,"Brabrand.xlsx")

Brænderup <- Folketælling1834 %>% 
  filter(Herred=="Vends")
Brænderup2 <- Brænderup %>% 
  filter(Matr_nr_adresse=="Holsegaard")
write_xlsx(Brænderup2,"Brænderup.xlsx")
Malt<-Folketælling1834 %>% 
  filter(Herred=="Malt")
Malt2 <- Malt %>% 
  filter(Matr_nr_adresse=="Hundsbæk Hovedgaard")
write_xlsx(Malt2,"Malt.xlsx")

Grejs <- Folketælling1834 %>% 
  filter(Sogn=="Grejs")
Grejs2 <- Grejs %>% 
  filter(Matr_nr_adresse=="Høigaard Howedgaard")
write_xlsx(Grejs2,"Grejs.xlsx")
Sønder_Omme <- Folketælling1834 %>% 
  filter(Sogn=="Sønder Omme")
write_xlsx(Sønder_Omme,"Sønder_Omme.xlsx")

hem <- Folketælling1834 %>% 
  filter(Sogn=="Hem")
Rindum<-Folketælling1834 %>% 
  filter(Sogn=="Rindum")
write_xlsx(Rindum,"Rindum.xlsx")
Hundborg <- Folketælling1834 %>% 
  filter(Sogn=="Hundborg")
Sorø<-Folketælling1834 %>% 
  filter(Amt=="Sorø")
Handberg<-Folketælling1834 %>% 
  filter(Herred=="Hjerm")
Torup<-Folketælling1834 %>% 
  filter(Sogn=="Torup")
write_xlsx(Torup,"Torup.xlsx")
Sall<-Folketælling1834 %>% 
  filter(Herred=="Houlbjerg")
Humlum<-Folketælling1834 %>% 
  filter(Sogn=="Humlum")
write_xlsx(Humlum,"Humlum.xlsx")
systofte<-Folketælling1834 %>% 
  filter(Herred=="Falsters Sønder")
write_xlsx(systofte,"Systofte.xlsx")
Vestervig<-Folketælling1834 %>% 
  filter(Herred=="Refs")
write_xlsx(Vestervig,"Vestervig.xlsx")
Alslev<-Folketælling1834 %>% 
  filter(Sogn=="Alslev")
write_xlsx(Alslev,"Alslev.xlsx")
Rørbæk<-Folketælling1834 %>% 
  filter(Sogn=="Rørbæk")
write_xlsx(Rørbæk,"Rørbæk.xlsx")
Tjørring<-Folketælling1834 %>% 
  filter(Sogn=="Tjørring")
write_xlsx(Tjørring,"Tjørring.xlsx")
Skærm<-Folketælling1834 %>% 
  filter(Herred=="Øster Han")
write_xlsx
Eritsø <- Folketælling1834 %>% 
  filter(Herred=="Elbo")
write_xlsx(Eritsø,"Eritsø.xlsx")
Tjæreborg<-Folketælling1834 %>% 
  filter(Sogn=="Tjæreborg")
write_xlsx(Tjæreborg,"Tjæreborg.xlsx")
Flynder<-Folketælling1834 %>% 
  filter(Sogn=="Flynder")
write_xlsx(Flynder,"Flynder.xlsx")
Give<-Folketælling1834 %>% 
  filter(Sogn=="Give")
write_xlsx(Give,"Give.xlsx")
Sejerslev<-Folketælling1834 %>% 
  filter(Sogn=="Sejerslev")
write_xlsx(Sejerslev,"Sejerslev.xlsx")
Thyregod<-Folketælling1834 %>% 
  filter(Sogn=="Thyregod")
write_xlsx(Thyregod,"Thyregod.xlsx")
Falslev<-Folketælling1834 %>% 
  filter(Sogn=="Falslev")
write_xlsx(Falslev,"Falslev.xlsx")
