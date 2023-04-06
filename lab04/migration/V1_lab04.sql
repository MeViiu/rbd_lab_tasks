CREATE DATABASE taxidb;
CREATE TABLE uzytkownik (
  id serial PRIMARY KEY,
  imie varchar(100),
  nazwisko varchar(100),
  email varchar(100),
  nrTelefonu varchar(100)
);
CREATE TABLE pasazer (
  id serial PRIMARY KEY,
  uzytkownik int UNIQUE ,
  preferowanyTypPlatnosci int
);

CREATE TABLE ocenaPasazera (
  id serial PRIMARY KEY,
  zachowanie int NOT NULL,
  terminowosc int NOT NULL,
  pasazer_id int NOT NULL,
  przejazd_id int UNIQUE NOT NULL
);
CREATE TABLE ocenaKierowcy (
  id serial PRIMARY KEY,
  umiejetnosci int NOT NULL,
  stanSamochodu int NOT NULL,
  przestrzeganiePrzepisow int NOT NULL,
  kierowca_id int NOT NULL,
  przejazd_id int UNIQUE NOT NULL
);
CREATE TABLE kierowca (
  id serial PRIMARY KEY,
  zdjecie bytea,
  uzytkownik_id int UNIQUE NOT NULL
);
CREATE TABLE samochodKierowcy (
  id serial PRIMARY KEY,
  nr_rejestracyjny varchar(25),
  kolor varchar(25),
  samochod_id int NOT NULL,
  kierowca_id int NOT NULL
);
CREATE TABLE samochod (
  id serial PRIMARY KEY,
  marka varchar(100),
  model varchar(100),
  typPojazdu_id int NOT NULL
);
CREATE TABLE typPojazdu (
  id serial PRIMARY KEY,
  nazwa varchar(50) NOT NULL
);
CREATE TABLE address (
  id serial PRIMARY KEY,
  imie varchar(100),
  nazwisko varchar(100),
  email varchar(100),
  nr_telefonu varchar(100)
);
CREATE TABLE pojazd (
  id serial PRIMARY KEY,
  dystans int NOT NULL,
  kierowca_id int NOT NULL,
  pasazer_id int NOT NULL,
  platnosc_id int UNIQUE NOT NULL,
  samochodKierowcy_id int NOT NULL,
  adres_odbioru_id int NOT NULL,
  adres_destynacja_id int NOT NULL
);
CREATE TABLE typPlatnosci (
  id serial PRIMARY KEY,
  nazwa varchar(50) NOT NULL
);
CREATE TABLE platnosc (
  id serial PRIMARY KEY,
  wartosc money NOT NULL,
  typPlatnosci_id int NOT NULL
);
CREATE TABLE adres (
  id serial PRIMARY KEY,
  ulica varchar(100) NOT NULL,
  numer_domu varchar(25),
  numer_mieszkania varchar(25),
  kod_pocztowy varchar(25) NOT NULL,
  miasto varchar(25) NOT NULL,
  kraj varchar(25) NOT NULL,
  obszar_id int UNIQUE NOT NULL
);

INSERT INTO
  uzytkownik (imie, nazwisko, email, nrTelefonu)
VALUES
  ('Tomasz', 'Zawadzki', 'asd@wp.pl', '123456789'),
  ('Darek', 'Długosz', 'ddlu@ic.pl', '162578237'),
  ('Kaya', 'Fisher', 'mrta@gb.com', '801136476');
INSERT INTO
  pasazer (uzytkownik_id, preferowanyTypPlatnosci)
VALUES
  ('1', '1'),
  ('2', '2'),
  ('3','1');

INSERT INTO
  ocenaPasazera (zachowanie, terminowosc, pasazer_id, przejazd_id)
VALUES
  ('4', '4', '1', '12'),
  ('3', '5', '2', '37'),
  ('5', '5', '3', '76');

INSERT INTO
  ocenaKierowcy (umiejetnosci, stanSamochodu, przestrzeganiePrzepisow, kierowca_id, przejazd_id)
VALUES
  ('5', '5', '4', '3', '12'),
  ('3', '2', '4', '2', '37'),
  ('5', '5', '5', '1', '76');

INSERT INTO
  kierowca (zdjecie, uzytkownik_id)
VALUES
  ('1', '1'),
  ('1', '2'),
  ('1', '3');

INSERT INTO
  samochodKierowcy (nr_rejestracyjny, kolor, samochod_id, kierowca_id)
VALUES
  ('GD 45315', 'Czarny', '1', '2'),
  ('KR 124GF', 'Srebrny', '2', '3'),
  ('WY 561VS', 'Zielony', '3', '1');

INSERT INTO
  samochod (marka, model, typPojazdu_id)
VALUES
  ('Mercedes', 'Vito', '4'),
  ('Toyota', 'Prius', '2'),
  ('Seat', 'Ibiza', '3');

INSERT INTO
  typPojazdu (nazwa)
VALUES
  ('Kombi'),
  ('Sedan'),
  ('Cupe'),
  ('Van');

INSERT INTO
  pojazd (dystans, kierowca_id, pasazer_id, platnosc_id, samochodKierowcy_id, adres_odbioru_id, adres_destynacja_id)
VALUES
  ('34', '1', '1','2','6','5','20'),
  ('12', '8', '2','62','67','13','1'),
  ('8', '4', '9','22','67','24','9');

INSERT INTO
  typPlatnosci (nazwa)
VALUES
  ('Karta'),
  ('Gotówka'),
  ('Voucher'),
  ('Bon');

INSERT INTO
  platnosc (wartosc, typPlatnosci_id)
VALUES
  ('55','1'),
  ('120','2'),
  ('24','4');

INSERT INTO
  adres (ulica, numer_domu, numer_mieszkania, kod_pocztowy, miasto, kraj, obszar_id)
VALUES
  ('Łąkowa', '60', '55', '80-100', 'Gdańsk','Polska','1'),
  ('Podwale Staromiejskie', '50', '51', '80-100', 'Gdańsk','Polska','2'),
  ('Targ Drzewny', '8', '2', '80-100', 'Gdańsk','Polska','3');

INSERT INTO
  obszar (nazwa)
VALUES
  ('Śródmieście'),
  ('Letnica'),
  ('Łostowice');
  SELECT * FROM obszar;
SELECT * FROM adres;
SELECT * FROM użytkownik;
