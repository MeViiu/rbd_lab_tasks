--1
DELETE FROM obszar;
--2
DROP TABLE pasazer;
CREATE TABLE pasazer (
  id serial PRIMARY KEY,
  uzytkownik int UNIQUE ,
  preferowanyTypPlatnosci int
);
ALTER TABLE pasazer
  ADD CONSTRAINT pasazer_FK
  FOREIGN KEY (uzytkownik_id) REFERENCES uzytkownik(id);

--3
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
  ('3','1')

  UPDATE pasazer SET preferowanyTypPlatnosci = 2 WHERE id = 1;

  ALTER TABLE pasazer
  ADD CONSTRAINT pasazer2_FK
  FOREIGN KEY (preferowanytypplatnosci) REFERENCES platnosc(id);
  --4
  alter table kierowca
    add constraint kierowca_fk
        foreign key (uzytkownik_id) references uzytkownik
        ON UPDATE CASCADE;
alter table ocenakierowcy
    add constraint ocenakierowcy_kierowca_id_fk
        foreign key (kierowca_id) references kierowca
        ON UPDATE CASCADE;;