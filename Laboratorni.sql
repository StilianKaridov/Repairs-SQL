--Syzdavane na tablica za grupite na uslugata
CREATE TABLE Grupa
(
    grupa_id INTEGER NOT NULL,
    group_name VARCHAR(25)
);
ALTER TABLE Grupa ADD CONSTRAINT Grupa_PK PRIMARY KEY(grupa_id);

--Dobavqne na danni
INSERT INTO Grupa(grupa_id, group_name) VALUES(1, 'Pyrva Grupa');
INSERT INTO Grupa(grupa_id, group_name) VALUES(2, 'Vtora Grupa');
INSERT INTO Grupa(grupa_id, group_name) VALUES(3, 'Treta Grupa');
INSERT INTO Grupa(grupa_id, group_name) VALUES(4, 'Chetvyrta Grupa');
INSERT INTO Grupa(grupa_id, group_name) VALUES(5, 'Peta Grupa');
 
--Promqna i iztrivane
UPDATE Grupa SET group_name = 'Chetvarta grupa' WHERE grupa_id = 4;
DELETE FROM Grupa WHERE grupa_id = 5;
 
--Suzdavane na tablica za uslugi
CREATE TABLE Usluga
(
    service_id INTEGER NOT NULL,
    service_name VARCHAR(30),
    service_grupa_id INTEGER NOT NULL,
    service_price NUMBER(6,2)
);
ALTER TABLE Usluga ADD CONSTRAINT Service_PK PRIMARY KEY(service_id);
ALTER TABLE Usluga ADD CONSTRAINT Service_FK FOREIGN KEY(service_grupa_id) REFERENCES Grupa(grupa_id);
 
--Dobavqne na danni
INSERT INTO Usluga(service_id, service_name, service_grupa_id, service_price) VALUES(1, 'Smqna na boiler', 1, 150.50);
INSERT INTO Usluga(service_id, service_name, service_grupa_id, service_price) VALUES(2, 'Polirane na farove', 2, 60.00);
INSERT INTO Usluga(service_id, service_name, service_grupa_id, service_price) VALUES(3, 'Izgrajdane na izkustven teren', 3, 250.00);
INSERT INTO Usluga(service_id, service_name, service_grupa_id, service_price) VALUES(4, 'Smqna na pokriv', 4, 750.00);
INSERT INTO Usluga(service_id, service_name, service_grupa_id, service_price) VALUES(5, 'Popravqne na slushalki', 4, 40.00);
 
--Promqna i iztrivane
UPDATE Usluga SET service_price = 50.00 WHERE service_id = 5;
DELETE FROM Usluga WHERE service_id = 4;
 
--Syzdavane na tablica za poziciq
CREATE TABLE Positions
(
    pos_id INTEGER NOT NULL,
    pos_name VARCHAR(25)
);
ALTER TABLE Positions ADD CONSTRAINT Positions_PK PRIMARY KEY(pos_id);

--Dobavqne na danni
INSERT INTO Positions(pos_id, pos_name) VALUES(1, 'Shef');
INSERT INTO Positions(pos_id, pos_name) VALUES(2, 'Glaven direktor');
INSERT INTO Positions(pos_id, pos_name) VALUES(3, 'Izpulnitelen direktor');
INSERT INTO Positions(pos_id, pos_name) VALUES(4, 'Obsht rabotnik');
INSERT INTO Positions(pos_id, pos_name) VALUES(5, 'Chistach');
 
--Promqna i iztrivane
UPDATE Positions SET pos_name = 'Zamestnik glaven direktor' WHERE pos_id = 2;
DELETE FROM Positions WHERE pos_id = 5;
 
--Syzdavane na tablica za slujitel
CREATE TABLE Employee
(
    employee_id INTEGER NOT NULL,
    employee_name VARCHAR(25),
    employee_position_id INTEGER NOT NULL,
    employee_MobileNumber VARCHAR(10)
);
ALTER TABLE Employee ADD CONSTRAINT Employee_PK PRIMARY KEY(employee_id);
ALTER TABLE Employee ADD CONSTRAINT Employee_FK FOREIGN KEY(employee_position_id) REFERENCES Positions(pos_id);
 
 --Dobavqne v tablicata
INSERT INTO Employee(employee_id, employee_name, employee_position_id, employee_MobileNumber) VALUES(1, 'Ivan', 1, '1');
INSERT INTO Employee(employee_id, employee_name, employee_position_id, employee_MobileNumber) VALUES(2, 'Georgi', 2, '12');
INSERT INTO Employee(employee_id, employee_name, employee_position_id, employee_MobileNumber) VALUES(3, 'Stilian', 3, '123');
INSERT INTO Employee(employee_id, employee_name, employee_position_id, employee_MobileNumber) VALUES(4, 'Dimitar', 4, '1234');
INSERT INTO Employee(employee_id, employee_name, employee_position_id, employee_MobileNumber) VALUES(5, 'Vladimir', 3, '12345');
 
--Promqna i iztrivane
UPDATE Employee SET employee_position_id = 1 WHERE employee_id = 3;
DELETE FROM Employee WHERE employee_id = 5;
 
--Syzdavane na tablica s informaciq na klient
CREATE TABLE Klient
(
    client_id INTEGER NOT NULL,
    client_name VARCHAR(25),
    client_MobileNumber VARCHAR(10)
);
ALTER TABLE Klient ADD CONSTRAINT Klient_PK PRIMARY KEY(client_id);
 
 
--Dobavqne na danni
INSERT INTO Klient(client_id, client_name, client_MobileNumber) VALUES(1, 'Veselin', '0897');
INSERT INTO Klient(client_id, client_name, client_MobileNumber) VALUES(2, 'Mario', '0888');
INSERT INTO Klient(client_id, client_name, client_MobileNumber) VALUES(3, 'Martin', '0589');
INSERT INTO Klient(client_id, client_name, client_MobileNumber) VALUES(4, 'Nikola', '0378');
INSERT INTO Klient(client_id, client_name, client_MobileNumber) VALUES(5, 'Mihail', '0989');
 
--Promqna i iztrivane
UPDATE Klient SET client_MobileNumber = '0896' WHERE client_id = 3;
DELETE FROM Klient WHERE client_id = 4;
 
--Syzdavane na tablica za remonti
CREATE TABLE Remont
(
    repair_id INTEGER NOT NULL,
    repair_Date DATE,
    repair_money NUMBER(6, 2),
    employee_id INTEGER NOT NULL 
);
ALTER TABLE Remont ADD CONSTRAINT Remont_PK PRIMARY KEY(repair_id);
ALTER TABLE Remont ADD CONSTRAINT Remont_FK FOREIGN KEY(employee_id) REFERENCES Employee(employee_id);
 
--Dobavqne na danni
INSERT INTO Remont(repair_id, repair_date, repair_money, employee_id) VALUES(1, '05-MAR-2021', 20.00, 1);
INSERT INTO Remont(repair_id, repair_date, repair_money, employee_id) VALUES(2, '04-MAR-2020', 30.00, 2);
INSERT INTO Remont(repair_id, repair_date, repair_money, employee_id) VALUES(3, '03-MAR-2019', 35.00, 3);
INSERT INTO Remont(repair_id, repair_date, repair_money, employee_id) VALUES(4, '02-MAR-2018', 40.00, 3);
INSERT INTO Remont(repair_id, repair_date, repair_money, employee_id) VALUES(5, '01-MAR-2017', 50.00, 3);
 
--Promqna i iztrivane
UPDATE Remont SET repair_money = 10.00 WHERE repair_id = 3;
DELETE FROM Remont WHERE repair_id = 5;
 
--Syzdavane na pyrvata mejdinna tablica
CREATE TABLE Middle
(
    repair_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL
);
ALTER TABLE Middle ADD CONSTRAINT Middle_PK PRIMARY KEY(repair_id, service_id);
ALTER TABLE Middle ADD CONSTRAINT Middle_FK FOREIGN KEY(repair_id) REFERENCES Remont(repair_id);
ALTER TABLE Middle ADD CONSTRAINT Middle_FK2 FOREIGN KEY(service_id) REFERENCES Usluga(service_id);

--Dobavqne na danni
INSERT INTO Middle(repair_id, service_id) VALUES(1, 1);
INSERT INTO Middle(repair_id, service_id) VALUES(2, 2);
INSERT INTO Middle(repair_id, service_id) VALUES(3, 3);
INSERT INTO Middle(repair_id, service_id) VALUES(4, 2);
INSERT INTO Middle(repair_id, service_id) VALUES(3, 2);

--Promqna i iztrivane
UPDATE Middle SET repair_id = 2 WHERE service_id = 1;
DELETE FROM Middle WHERE repair_id = 4;
 
--Syzdavane na vtorata mejdinna tablica
CREATE TABLE Middle2
(
    client_id INTEGER NOT NULL,
    repair_id INTEGER NOT NULL
);
ALTER TABLE Middle2 ADD CONSTRAINT Middle2_PK PRIMARY KEY(client_id, repair_id);
ALTER TABLE Middle2 ADD CONSTRAINT Middle2_FK FOREIGN KEY(client_id) REFERENCES Klient(client_id);
ALTER TABLE Middle2 ADD CONSTRAINT Middle2_FK2 FOREIGN KEY(repair_id) REFERENCES Remont(repair_id);
 
--Dobavqne na danni
INSERT INTO Middle2(client_id, repair_id) VALUES(1, 1);
INSERT INTO Middle2(client_id, repair_id) VALUES(2, 2);
INSERT INTO Middle2(client_id, repair_id) VALUES(3, 3);
INSERT INTO Middle2(client_id, repair_id) VALUES(3, 4);
INSERT INTO Middle2(client_id, repair_id) VALUES(5, 3);
 
--Promqna i iztrivane ot tablicata
UPDATE Middle2 SET repair_id = 4 WHERE client_id = 5;
DELETE FROM Middle2 WHERE client_id = 5;

--Tarsene na usluga po cena
select u.service_id, u.service_name, u.service_price, g.group_name, u.service_grupa_id
from usluga u
join grupa g on g.grupa_id = u.service_grupa_id
where u.service_price = &service_price;

--Tarsene na usluga po ime
select u.service_id, u.service_name, u.service_price, g.group_name, u.service_grupa_id
from usluga u
join grupa g on g.grupa_id = u.service_grupa_id
where u.service_name = '&service_name';

--Tarsene na usluga po grupa
select u.service_id, u.service_name, u.service_price, g.group_name, u.service_grupa_id
from usluga u
join grupa g on g.grupa_id = u.service_grupa_id
where g.group_name = '&group_name';

--Spravka za remonti za period
select r.repair_Date, r.repair_money, e.employee_name, e.employee_mobileNumber, p.pos_name, c.client_name, u.service_name
from remont r
join employee e on e.employee_id = r.employee_id
join positions p on p.pos_id = e.employee_position_id
join klient c on c.client_id = r.repair_id
join usluga u on u.service_id = r.repair_id
where r.repair_Date between '&repair_Date' and '&repair_Date';

--Spravka za remonti za slujitel, podredeni po data
select e.employee_name, e.employee_mobileNumber, p.pos_name, r.repair_Date, r.repair_money, c.client_name, u.service_name
from remont r
join employee e on e.employee_id = r.employee_id
join positions p on p.pos_id = e.employee_position_id
join middle2 m2 on m2.repair_id = r.repair_id
join klient c on c.client_id = m2.client_id
join middle m1 on m1.repair_id = r.repair_id
join usluga u on u.service_id = m1.service_id
where e.employee_name = '&employee_name'
order by r.repair_Date;

--Spravka za remonti za klient
select c.client_name, c.client_mobileNumber, u.service_name, e.employee_name, r.repair_Date, r.repair_money
from remont r
join employee e on e.employee_id = r.employee_id
join middle2 m2 on m2.repair_id = r.repair_id
join klient c on c.client_id = m2.client_id
join middle m1 on m1.repair_id = r.repair_id
join usluga u on u.service_id = m1.service_id
where c.client_name = '&client_name';
