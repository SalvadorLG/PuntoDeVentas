/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : puntoventas

 Target Server Type    : MySQL
 Target Server Version : 50199
 File Encoding         : 65001

 Date: 28/07/2020 01:45:13
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for datosproduct
-- ----------------------------
DROP TABLE IF EXISTS `datosproduct`;
CREATE TABLE `datosproduct`  (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `folio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precio` float NULL DEFAULT NULL,
  `nombreProveedor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idProducto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of datosproduct
-- ----------------------------
BEGIN;
INSERT INTO `datosproduct` VALUES (1, 'Cuadernos Collage', 'Cuadernos, Libretas y Blocks', '00001', 56, 'Scribe'), (2, 'Goma', 'Escritura', '00002', 16.5, 'Pelikan'), (19, 'Lapices de Colores', 'Escritura', '00003', 84, 'BIC');
COMMIT;

-- ----------------------------
-- Table structure for flujocaja
-- ----------------------------
DROP TABLE IF EXISTS `flujocaja`;
CREATE TABLE `flujocaja`  (
  `folio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `montoEntrada` float NULL DEFAULT NULL,
  `montoApagar` float NULL DEFAULT NULL,
  `cambioAdar` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of flujocaja
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for listaproveedores
-- ----------------------------
DROP TABLE IF EXISTS `listaproveedores`;
CREATE TABLE `listaproveedores`  (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oficinasCentrales` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idProveedor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of listaproveedores
-- ----------------------------
BEGIN;
INSERT INTO `listaproveedores` VALUES (1, 'Paper Mate', 'Oak Brook, Illinois, Estados Unidos'), (2, 'BIC', 'Isla de Francia, Francia'), (3, 'Scribe', 'Tres Valles, Veracruz'), (4, 'Pelikan', 'Feusisberg, Suiza');
COMMIT;

-- ----------------------------
-- Table structure for listausuarios
-- ----------------------------
DROP TABLE IF EXISTS `listausuarios`;
CREATE TABLE `listausuarios`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellidoPaterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contrasena` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contrasena2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of listausuarios
-- ----------------------------
BEGIN;
INSERT INTO `listausuarios` VALUES (7, 'Administrador', 'Lopez', 'Salvador', 'salva@gmail.com', '123', '123');
COMMIT;

-- ----------------------------
-- Table structure for reportedeventas
-- ----------------------------
DROP TABLE IF EXISTS `reportedeventas`;
CREATE TABLE `reportedeventas`  (
  `fecha` date NULL DEFAULT NULL,
  `folioReporte` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cantidadArticulos` int(11) NULL DEFAULT NULL,
  `folioProduct` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `precioIndividual` float NULL DEFAULT NULL,
  `importetotal` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of reportedeventas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `fecha` date NULL DEFAULT NULL,
  `folioticket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cantidadproduct` int(11) NULL DEFAULT NULL,
  `folioProduct` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `importe` float NULL DEFAULT NULL,
  `totarticulos` int(11) NULL DEFAULT NULL,
  `subtotal` float NULL DEFAULT NULL,
  `totalIVA` float NULL DEFAULT NULL,
  `totalApagar` float NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of ticket
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
