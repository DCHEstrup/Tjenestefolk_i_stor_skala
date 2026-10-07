library(writexl)
library(tidyverse)
Folketælling1850 <- read_csv("census_1850__v1__cl.csv")
Køng<-Folketælling1850 %>% 
  filter(Herred=="Hammer")
Biersted<-Folketælling1850 %>% 
  filter(Sogn=="Biersted")
write_xlsx(Biersted,"Biersted.xlsx")
St.Peder <- Folketælling1850 %>% 
  filter(Sogn=="Sankt Peders Landsogn")
Give<-Folketælling1850 %>% 
  filter(Sogn=="Give")
write_xlsx(Give,"give.xlsx")
Kværndrup<-Folketælling1850 %>% 
  filter(Amt=="Svendborg")
library(dplyr)
antal<-Kværndrup %>% count(Sogn)
Lynby<-Folketælling1850 %>% 
  filter(Sogn=="Lyngby")
write_xlsx(Lynby,"Lyngby.xlsx")
Nørre_Bork<- Folketælling1850 %>% 
  filter(Sogn=="Nørre Bork")
Hammer<-Folketælling1850 %>% 
  filter(Sogn=="Hammer")
write_xlsx(Hammer,"Hammer.xlsx")
Hyllinge<-Folketælling1850 %>% 
  filter(Amt=="Sorø")
Hvidbjerg<-Folketælling1850 %>% 
  filter(Sogn=="Hvidbjerg")
write_xlsx(Hvidbjerg,"Hvidbjerg.xlsx")
Henne<-Folketælling1850 %>% 
  filter(Sogn=="Henne")
write_xlsx(Henne,"Henne.xlsx")
Grejs<-Folketælling1850 %>% 
  filter(Sogn=="Grejs")
write_xlsx(Grejs,"Grejs.xlsx")
Slagelse<-Folketælling1850 %>% 
  filter(Herred=="Slagelse")
write_xlsx(Slagelse,"Slagelse.xlsx")
Åstrup<-Folketælling1850 %>% 
  filter(Sogn=="Aastrup")
write_xlsx(Åstrup,"Aastrup.xlsx")
Hem<-Folketælling1850 %>% 
  filter(Sogn=="Svenstrup")
write_xlsx(Hem,"Hem.xlsx")
Asp<-Folketælling1850 %>% 
  filter(Sogn=="Asp")
write_xlsx(Asp,"Asp.xlsx")
Sønder_Vissing<- Folketælling1850 %>% 
  filter(Amt=="Skanderborg")
Gjerslev<-Folketælling1850 %>% 
  filter(Sogn=="Gierslev")
write_xlsx(Gjerslev,"Gjerslev.xlsx")
Grinderslev<-Folketælling1850 %>% 
  filter(Sogn=="Grinderslev")
write_xlsx(Grinderslev,"Grinderslev.xlsx")
Skarild<-Folketælling1850 %>% 
  filter(Sogn=="Skarrild")
write_xlsx(Skarild,"Skarild.xlsx")
Stouby<- Folketælling1850 %>% 
  filter(Herred=="Bjerre")
Gammel_Rye<- Folketælling1850 %>% 
  filter(Sogn=="Gammel Rye")
Marie_Magdalene<-Folketælling1850 %>% 
  filter(Sogn=="Marie Magdalene")
write_xlsx(Marie_Magdalene,"Marie.xlsx")
Hundborg<-Folketælling1850 %>% 
  filter(Sogn=="Hundborg")
write_xlsx(Hundborg,"Hundborg.xlsx")
Nors<-Folketælling1850 %>% 
  filter(Sogn=="Nors")
write_xlsx(Nors,"Nors.xlsx")
Køng<-Folketælling1850 %>% 
  filter(Sogn=="Køng")
Handberg<-Folketælling1850 %>% 
  filter(Herred=="Hjerm")
Guldager<-Folketælling1850 %>% 
  filter(Sogn=="Guldager")
write_xlsx(Guldager,"Guldager.xlsx")
Ulfborg<- Folketælling1850 %>% 
  filter(Sogn=="Ulfborg")
write_xlsx(Ulfborg,"Ulfborg.xlsx")
Kallerup<-Folketælling1850 %>% 
  filter(Sogn=="Kallerup")
write_xlsx(Kallerup,"Kallerup.xlsx")
Sonnerup<-Folketælling1850 %>% 
  filter(Sogn=="Sonnerup")
write_xlsx(Sonnerup,"Sonnerup.xlsx")
Torup<-Folketælling1850 %>% 
  filter(Amt=="Aalborg")
write_xlsx(Torup,"Torup.xlsx")
Sall<-Folketælling1850 %>% 
  filter(Herred=="Houlbjerg")
Systofte<-Folketælling1850 %>% 
  filter(Herred=="Falsters Sønder")
Vestervig<-Folketælling1850 %>% 
  filter(Sogn=="Vestervig")
write_xlsx(Vestervig,"Vestervig.xlsx")
Eritsø<-Folketælling1850 %>% 
  filter(Sogn=="Erritsø")
write_xlsx(Eritsø,"Eritsø.xlsx")
Give<-Folketælling1850 %>% 
  filter(Sogn=="Give")
write_xlsx


Aale<-Folketælling1850 %>% 
  filter(Sogn=="Aale")
write_xlsx(Aale,"Aale.xlsx")
