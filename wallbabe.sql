CREATE DATABASE WallBabe
USE WallBabe

CREATE TABLE Cajero(
Id_cajero VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(25),
Direccion VARCHAR(30),
Telefono INT,
Sueldo MONEY
)

CREATE TABLE Cliente(
Id_cliente VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(25),
Direccion VARCHAR(30),
Telefono INT
)

CREATE TABLE Proveedor(
Id_proveedor VARCHAR(10) PRIMARY KEY,
Marca VARCHAR(20),
Nombre VARCHAR(25),
Direccion VARCHAR(30),
Telefono INT,
Sueldo MONEY
)

CREATE TABLE Categoria(
Id_categoria VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(25),
Descripcion VARCHAR(30)
)

CREATE TABLE Producto(
Id_producto VARCHAR(10) PRIMARY KEY,
Id_proveedor VARCHAR(10) FOREIGN KEY REFERENCES Proveedor(Id_proveedor),
Id_categoria VARCHAR(10) FOREIGN KEY REFERENCES Categoria(Id_categoria),
Nombre VARCHAR(25),
Precio MONEY,
Descripcion VARCHAR(30),
)

CREATE TABLE Venta(
Id_venta VARCHAR(10) PRIMARY KEY, 
Id_producto VARCHAR(10) FOREIGN KEY REFERENCES Producto(Id_producto),
Id_cajero VARCHAR(10) FOREIGN KEY REFERENCES Cajero(Id_cajero),
Id_cliente VARCHAR(10) FOREIGN KEY REFERENCES Cliente(Id_cliente)
)

SELECT * FROM Cajero
SELECT * FROM Cliente
SELECT * FROM Proveedor
SELECT * FROM Categoria
SELECT * FROM Producto
SELECT * FROM Venta

INSERT INTO Cajero
VALUES ('CJ001', 'Leonard', 'La Follette Parkway', 12345678, 643.83)
INSERT INTO Cajero
VALUES ('CJ002', 'Glenden', 'Mifflin Park', 95736574, 356.04)
INSERT INTO Cajero
VALUES ('CJ003', 'Ailis', 'High Crossing Court', 92221660, 904.83)
INSERT INTO Cajero
VALUES ('CJ004', 'Paton', 'Delladonna Road', 47042148, 542.38)
INSERT INTO Cajero
VALUES ('CJ005', 'Benji', 'Norway Maple Avenue', 70087674, 793.01)

INSERT INTO Cliente
VALUES('CL001', 'Kathie', '62347 Melvin Plaza', 55827563)
INSERT INTO Cliente
VALUES('CL002', 'Beverley', '877 Ronald Regan Parkway', 89376002)
INSERT INTO Cliente
VALUES('CL003', 'Delly', '23856 South Junction', 99133378)
INSERT INTO Cliente
VALUES('CL004', 'Ulrich', '8225 Bunker Hill Crossing', 13564942)
INSERT INTO Cliente
VALUES('CL005', 'Sofie', '68775 Blaine Drive', 24355854)

INSERT INTO Proveedor
VALUES('PR001', 'Colony NorthStar Inc', 'Lesli', '144 Maple Wood Terrace', 14991397, 572.71)
INSERT INTO Proveedor
VALUES('PR002','Macquarie Global', 'Kermit', '570 Hauk Pass', 40516988, 659.40)
INSERT INTO Proveedor
VALUES('PR003','Food Street', 'Claudelle', '68554 Northport Pass', 54483125, 554.54)
INSERT INTO Proveedor
VALUES('PR004','Immune Design Corp.', 'Savina', '13364 Raven Center', 94669753, 337.27)
INSERT INTO Proveedor
VALUES('PR005', 'Domino''s Pizza Inc', 'Roxane', '2644 Westridge Circle', 79518009, 597.31)

INSERT INTO Categoria
VALUES ('CT001', 'Frutas', 'Frutas Saludables')
INSERT INTO Categoria
VALUES ('CT002', 'Verduras', 'Verduras Frescos')
INSERT INTO Categoria
VALUES ('CT003', 'Juguetes', 'Juguetes para niños')
INSERT INTO Categoria
VALUES ('CT004', 'Cocina', 'Productos de cocina')
INSERT INTO Categoria
VALUES ('CT005', 'Libros', 'Libros para todos')

INSERT INTO Producto
VALUES('PR001', 'PR005', 'CT005', 'Harry Potter', 500, 'Libro HP')
INSERT INTO Producto
VALUES('PR002', 'PR003', 'CT001', 'Naranjas', 50, 'Kilo de Naranjas')
INSERT INTO Producto
VALUES('PR003', 'PR002', 'CT002', 'Jitomates', 40, 'Kilo de Jitomates')
INSERT INTO Producto
VALUES('PR004', 'PR002', 'CT004', 'Sartenes', 1500, 'Juego de Sartenes')
INSERT INTO Producto
VALUES('PR005', 'PR001', 'CT003', 'Jenga', 250, 'Juego de Mesa')
INSERT INTO Producto
VALUES('PR006', 'PR001', 'CT002', 'Aguacate', 90, 'Kilo de Aguacate')
INSERT INTO Producto
VALUES('PR007', 'PR001', 'CT001', 'Platanos', 60, 'Kilo de Platanos')
INSERT INTO Producto
VALUES('PR008', 'PR004', 'CT004', 'Cuchillos', 700, 'Juego de Cuchillos')
INSERT INTO Producto
VALUES('PR009', 'PR004', 'CT003', 'Adivina Quien', 350, 'Juego de Mesa')
INSERT INTO Producto
VALUES('PR0010', 'PR005', 'CT005', 'Los Juegos del Hambre', 200, 'Libro HP')

INSERT INTO Venta
VALUES ('VN001', 'PR002', 'CJ001', 'CL005')
INSERT INTO Venta
VALUES ('VN002', 'PR009', 'CJ003', 'CL001')
INSERT INTO Venta
VALUES ('VN003', 'PR006', 'CJ004', 'CL003')
INSERT INTO Venta
VALUES ('VN004', 'PR003', 'CJ002', 'CL002')
INSERT INTO Venta
VALUES ('VN005', 'PR007', 'CJ005', 'CL004')

create view vistauno as
SELECT id_producto, Nombre
FROM Producto
UNION ALL
SELECT Id_categoria, Nombre
FROM Categoria

create view vistados as
SELECT id_venta from Venta
INNER JOIN Cliente
ON Venta.Id_cliente = Cliente.Id_cliente

create view vistatres as
SELECT Producto.nombre, Venta.Id_venta
FROM Producto , Venta
WHERE Producto.Id_producto = Venta.Id_producto;

create view vistacuatro as
Select Venta.Id_producto, Producto.Nombre
from Venta Inner Join Producto
on venta.Id_producto = Producto.Id_producto

create view vistacinco as
Select Producto.Id_proveedor, Proveedor.Nombre
from Producto Inner Join Proveedor
on Producto.Id_proveedor = Proveedor.Id_proveedor

create view vistaseis as
Select Producto.Id_producto, Producto.Nombre
from Producto Left Join Venta 
on Producto.Id_producto = Venta.Id_producto


create view vistasiete as
SELECT Producto.Id_producto, Producto.Id_categoria,
Producto.Id_proveedor
FROM Producto LEFT JOIN VENTA ON
Producto.Id_producto =Venta.Id_producto
WHERE Venta.Id_producto = 'PR003'

create view vistaocho as 
SELECT Producto.Id_producto, Producto.Nombre, Producto.Precio
FROM Producto RIGHT JOIN Venta
ON Producto.Id_producto = Venta.Id_producto
WHERE Precio > 200

create view vistaNueve as 
SELECT Categoria.Id_categoria, Categoria.Nombre
FROM Categoria
INNER JOIN Producto
ON Producto.Id_categoria = Categoria.Id_categoria
WHERE Producto.Id_categoria = 'CT001'

create view vistaDiez as 
SELECT Categoria.Id_categoria, Categoria.Nombre
FROM Categoria
INNER JOIN Producto
ON Producto.Id_categoria = Categoria.Id_categoria
WHERE Producto.Id_categoria = 'CT002'

create view vistaOnce as 
SELECT Proveedor.Id_proveedor, Proveedor.Nombre, Proveedor.Telefono
FROM Proveedor
INNER JOIN Producto
ON Producto.Id_proveedor = Proveedor.Id_proveedor
WHERE Producto.Id_proveedor = 'PR002'

create view vistaDoce as 
SELECT Proveedor.Id_proveedor, Proveedor.Nombre, Proveedor.Telefono
FROM Proveedor
INNER JOIN Producto
ON Producto.Id_proveedor = Proveedor.Id_proveedor
WHERE Producto.Id_proveedor = 'PR004'

create view vistaTrece as 
SELECT Categoria.Id_categoria, Categoria.Nombre
FROM Categoria
INNER JOIN Producto
ON Producto.Id_categoria = Categoria.Id_categoria
WHERE Categoria.Nombre = 'Libros'

create view vistaCatorce as 
SELECT Cajero.Id_cajero, Cajero.Nombre, Cajero.Telefono
FROM Cajero
INNER JOIN Venta
ON Venta.Id_cajero = Cajero.Id_cajero
WHERE Venta.Id_cajero = 'CJ001' OR Venta.Id_cajero = 'CJ002'

create view vistaQuince as 
SELECT Cliente.Id_cliente, Cliente.Nombre, Cliente.Telefono
FROM Cliente
INNER JOIN Venta
ON Venta.Id_cliente = Cliente.Id_cliente
WHERE Cliente.Nombre = 'Sofie'

create view vistaDieciseis as 
SELECT Cliente.Id_cliente, Cliente.Nombre, Cliente.Telefono
FROM Cliente
INNER JOIN Venta
ON Venta.Id_cliente = Cliente.Id_cliente
WHERE Cliente.Id_cliente = 'CL001'

CREATE PROCEDURE consultacategorias
@id_categoria varchar(10)
AS
SELECT * 
FROM Categoria
WHERE @id_categoria = Id_categoria

consultacategorias 'CT005' 

CREATE PROCEDURE consultacliente
@id_cliente varchar (10)
as select * 
From Cliente 
where @id_cliente = Id_cliente

consultacliente 'CL003'

CREATE PROCEDURE createCate
@Id_categoria VARCHAR(10), @Nombre VARCHAR(25), @Descripcion VARCHAR(30)
AS
INSERT INTO Categoria
VALUES (@Id_categoria, @Nombre, @Descripcion)
SELECT * FROM Categoria

CREATE PROCEDURE deleteProd
@Id_producto VARCHAR(10)
AS
DELETE FROM Producto
WHERE Id_producto = @Id_producto
SELECT * FROM Producto

CREATE PROCEDURE updateProd
@Nombre VARCHAR(25), @Id_producto VARCHAR(10)
AS
UPDATE Producto
SET Nombre = @Nombre
WHERE Id_producto = @Id_producto
SELECT * FROM Producto