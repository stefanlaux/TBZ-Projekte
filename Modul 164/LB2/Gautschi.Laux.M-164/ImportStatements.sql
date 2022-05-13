-- import flug Tabelle:
INSERT INTO flug (HinflugDatum, RueckflugDatum, HinflugZeit, RueckflugZeit, Reiseziel_idLaender,
                  Fluggesellschaft_idFluggesellschaft, Flugnummer_idFlugnummer)
                  
SELECT DISTINCT i.HinflugDatum, i.RuekflugDatum, i.HinflugZeit, i.RuekflugZeit,  l.idLaender, f.idFluggesellschaft, n.idFlugnummer FROM importtabelle i, fluggesellschaft f, flugnummer n, reiseziel l
WHERE i.Hinflug = n.Nummer
OR i.Ruekflug = n.Nummer
AND i.Reiseort = l.Land
AND i.Fluggesellschaft = f.GesellschaftName;

-- import personen Tabelle :
INSERT INTO personen (Name, Vorname, Adresse, Ort_idOrt) 
SELECT DISTINCT p.Name, p.Vorname, p.Adresse, i.idOrt from importtabelle p JOIN ort i ON p.ORT = i.Ort;

-- import ort Tabelle :
INSERT INTO ort (PLZ, Ort) 
SELECT PLZ, ORT from importtabelle;

-- import reiseziel Tabelle :
INSERT INTO reiseziel (Land) 
SELECT Reiseort from importtabelle;

-- import fluggesellschaft Tabelle :
INSERT INTO fluggesellschaft (GesellschaftName) 
SELECT DISTINCT fluggesellschaft from importtabelle;

-- import flugnummer Tabelle :
INSERT INTO flugnummer (Nummer) 
SELECT DISTINCT Ruekflug from importtabelle;
INSERT INTO flugnummer (Nummer) 
SELECT DISTINCT Hinflug from importtabelle;

-- import buchung Tabelle:
INSERT INTO buchung (BuchungsDatum, AnzahlNaechte, AnzahlPersonen, Personen_idPersonen, hotel_idHotel, flug_idFlug) 
SELECT DISTINCT i.Buchungsdatum, i.AnzahlNaechte, i.AnzahlPersonen, p.idPersonen, h.idHotel, f.idFlug from importtabelle i, personen p, hotel h, flug f, flugnummer n
WHERE i.Name = p.Name
AND i.Hotel = h.HotelName
AND n.idFlugnummer = f.Flugnummer_idFlugnummer
;

-- import hotel Tabelle :
INSERT INTO hotel (HotelName) 
SELECT DISTINCT Hotel from importtabelle;

