#17.12.13 10:20

#Roles
INSERT INTO userRoles (userRoleName)
VALUES ('ROLE_USER');

INSERT INTO userRoles (userRoleName)
VALUES ('ROLE_ADMIN');

#OrderStatus
INSERT INTO orderStatus (orderStatus)
VALUES ('Odottaa hyväksyntää');

INSERT INTO orderStatus (orderStatus)
VALUES ('Hyväksytty');

INSERT INTO orderStatus (orderStatus)
VALUES ('Odottaa palautusta');

INSERT INTO orderStatus (orderStatus)
VALUES ('Valmis');

INSERT INTO orderStatus (orderStatus)
VALUES ('Laskutettu');

INSERT INTO orderStatus (orderStatus)
VALUES ('Poistettu');

#TestCompanies
INSERT INTO companies (name, address, postalCode, city)
VALUES ('Testi firma', 'testiosoite', '02100', 'Helsinki');

INSERT INTO companies (name, address, postalCode, city)
VALUES ('testii firma', 'testiosoitee', '01000', 'Helsinki');

#TestUser
INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany)
VALUES ('Matti', 'Meikäläinen', '0400123123', 'matti.meikalainen@email.com', 'b3881fd2ec0d1f20b35b4dd589f536975db9240f26c399be23ed5bdc6764908feee54dba9763b069', 1, 1);

#TestAdmin
INSERT INTO registeredUsers (fName, lName, phoneNo, email, password, myRole, myCompany)
VALUES ('Timo', 'Tomera', '0400456456', 'timo.tomera@email.com', 'b3881fd2ec0d1f20b35b4dd589f536975db9240f26c399be23ed5bdc6764908feee54dba9763b069', 2, 2);