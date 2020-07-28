/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : puntoventas

 Target Server Type    : SQL Server
 Target Server Version : 14000000
 File Encoding         : 65001

 Date: 28/07/2020 01:42:08
*/


-- ----------------------------
-- Table structure for datosproduct
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[puntoventas].[datosproduct]') AND type IN ('U'))
	DROP TABLE [puntoventas].[datosproduct]
GO

CREATE TABLE [datosproduct] (
  [idProducto] int NOT NULL,
  [nombreProducto] nvarchar(50) NULL,
  [categoria] nvarchar(50) NULL,
  [folio] nvarchar(50) NULL,
  [precio] real NULL,
  [nombreProveedor] nvarchar(150) NOT NULL
)
GO


-- ----------------------------
-- Records of datosproduct
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [puntoventas].[datosproduct] VALUES (N'1', N'Cuadernos Collage', N'Cuadernos, Libretas y Blocks', N'00001', N'56', N'Scribe'), (N'2', N'Goma', N'Escritura', N'00002', N'16.5', N'Pelikan'), (N'19', N'Lapices de Colores', N'Escritura', N'00003', N'84', N'BIC')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for flujocaja
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[puntoventas].[flujocaja]') AND type IN ('U'))
	DROP TABLE [puntoventas].[flujocaja]
GO

CREATE TABLE [flujocaja] (
  [folio] nvarchar(50) NULL,
  [fecha] date NULL,
  [montoEntrada] real NULL,
  [montoApagar] real NULL,
  [cambioAdar] real NULL
)
GO


-- ----------------------------
-- Records of flujocaja
-- ----------------------------
BEGIN TRANSACTION
GO

COMMIT
GO


-- ----------------------------
-- Table structure for listaproveedores
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[puntoventas].[listaproveedores]') AND type IN ('U'))
	DROP TABLE [puntoventas].[listaproveedores]
GO

CREATE TABLE [listaproveedores] (
  [idProveedor] int NOT NULL,
  [nombreProveedor] nvarchar(100) NULL,
  [oficinasCentrales] nvarchar(200) NULL
)
GO


-- ----------------------------
-- Records of listaproveedores
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [puntoventas].[listaproveedores] VALUES (N'1', N'Paper Mate', N'Oak Brook, Illinois, Estados Unidos'), (N'2', N'BIC', N'Isla de Francia, Francia'), (N'3', N'Scribe', N'Tres Valles, Veracruz'), (N'4', N'Pelikan', N'Feusisberg, Suiza')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for listausuarios
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[puntoventas].[listausuarios]') AND type IN ('U'))
	DROP TABLE [puntoventas].[listausuarios]
GO

CREATE TABLE [listausuarios] (
  [ID] int NOT NULL,
  [tipoUsuario] nvarchar(50) NULL,
  [apellidoPaterno] nvarchar(50) NULL,
  [nombre] nvarchar(50) NULL,
  [Correo] nvarchar(50) NULL,
  [contrasena] nvarchar(50) NULL,
  [contrasena2] nvarchar(50) NULL
)
GO


-- ----------------------------
-- Records of listausuarios
-- ----------------------------
BEGIN TRANSACTION
GO

INSERT INTO [puntoventas].[listausuarios] VALUES (N'7', N'Administrador', N'Lopez', N'Salvador', N'salva@gmail.com', N'123', N'123')
GO

COMMIT
GO


-- ----------------------------
-- Table structure for reportedeventas
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[puntoventas].[reportedeventas]') AND type IN ('U'))
	DROP TABLE [puntoventas].[reportedeventas]
GO

CREATE TABLE [reportedeventas] (
  [fecha] date NULL,
  [folioReporte] nvarchar(50) NULL,
  [cantidadArticulos] int NULL,
  [folioProduct] nvarchar(50) NULL,
  [precioIndividual] real NULL,
  [importetotal] real NULL
)
GO


-- ----------------------------
-- Records of reportedeventas
-- ----------------------------
BEGIN TRANSACTION
GO

COMMIT
GO


-- ----------------------------
-- Table structure for ticket
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[puntoventas].[ticket]') AND type IN ('U'))
	DROP TABLE [puntoventas].[ticket]
GO

CREATE TABLE [ticket] (
  [fecha] date NULL,
  [folioticket] nvarchar(50) NULL,
  [cantidadproduct] int NULL,
  [folioProduct] nvarchar(20) NULL,
  [importe] real NULL,
  [totarticulos] int NULL,
  [subtotal] real NULL,
  [totalIVA] real NULL,
  [totalApagar] real NULL
)
GO


-- ----------------------------
-- Records of ticket
-- ----------------------------
BEGIN TRANSACTION
GO

COMMIT
GO


-- ----------------------------
-- Primary Key structure for table datosproduct
-- ----------------------------
ALTER TABLE [datosproduct] ADD PRIMARY KEY CLUSTERED ([idProducto])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Primary Key structure for table listaproveedores
-- ----------------------------
ALTER TABLE [listaproveedores] ADD PRIMARY KEY CLUSTERED ([idProveedor])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Primary Key structure for table listausuarios
-- ----------------------------
ALTER TABLE [listausuarios] ADD PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

