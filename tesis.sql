/*
Navicat PGSQL Data Transfer

Source Server         : Tesis
Source Server Version : 90204
Source Host           : localhost:5432
Source Database       : tesis
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90204
File Encoding         : 65001

Date: 2014-02-26 23:58:57
*/


-- ----------------------------
-- Sequence structure for sqaporte
-- ----------------------------
DROP SEQUENCE "public"."sqaporte";
CREATE SEQUENCE "public"."sqaporte"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 1000000
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
"id" int4 NOT NULL,
"menu_id" int4,
"nivel" int4 NOT NULL,
"orden" int4 NOT NULL,
"nombre" varchar(80) COLLATE "default" NOT NULL,
"url" varchar(120) COLLATE "default",
"icono" varchar(30) COLLATE "default",
"estado" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS "public"."rol";
CREATE TABLE "public"."rol" (
"id" int4 NOT NULL,
"nombre" varchar(30) COLLATE "default" NOT NULL,
"descripcion" varchar(100) COLLATE "default",
"estado" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO "public"."rol" VALUES ('1', 'Admin', 'administrador del sistema', '1');

-- ----------------------------
-- Table structure for rolmenu
-- ----------------------------
DROP TABLE IF EXISTS "public"."rolmenu";
CREATE TABLE "public"."rolmenu" (
"id" int4 NOT NULL,
"rol_id" int4 NOT NULL,
"menu_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of rolmenu
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario";
CREATE TABLE "public"."usuario" (
"id" int4 NOT NULL,
"rol_id" int4 NOT NULL,
"usuario" varchar(30) COLLATE "default" NOT NULL,
"clave" varchar(32) COLLATE "default" NOT NULL,
"email" varchar(60) COLLATE "default" NOT NULL,
"estado" int2,
"usuariocreacion" varchar(25) COLLATE "default" NOT NULL,
"fechacreacion" timestamp(6) NOT NULL,
"usuariomodificacion" varchar(25) COLLATE "default",
"fechamodificacion" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO "public"."usuario" VALUES ('1', '1', 'admin', 'admin', 'montesinos2005ii@gmail.com', '1', 'usu', '2013-01-01 00:00:00', 'usu', '2013-01-01 00:00:00');
INSERT INTO "public"."usuario" VALUES ('2', '1', 'admin22', 'admin2', 'admin22@gmail.com', null, 'admin', '2013-04-21 00:00:00', null, null);
INSERT INTO "public"."usuario" VALUES ('6', '1', 'admin3', 'admin3', 'prueba@gmail.com', null, 'admin', '2013-04-21 00:00:00', null, null);
INSERT INTO "public"."usuario" VALUES ('7', '1', 'admin2', 'admin2', 'prueba@gmail.com', null, 'admin', '2013-04-21 00:00:00', null, null);

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table menu
-- ----------------------------
CREATE INDEX "fk_Menu_Menu1" ON "public"."menu" USING btree (menu_id);

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rol
-- ----------------------------
ALTER TABLE "public"."rol" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rolmenu
-- ----------------------------
CREATE INDEX "fk_RolMenu_Menu1" ON "public"."rolmenu" USING btree (menu_id);
CREATE INDEX "fk_RolMenu_Rol" ON "public"."rolmenu" USING btree (rol_id);

-- ----------------------------
-- Primary Key structure for table rolmenu
-- ----------------------------
ALTER TABLE "public"."rolmenu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table usuario
-- ----------------------------
CREATE INDEX "fk_Usuario_Rol1" ON "public"."usuario" USING btree (rol_id);

-- ----------------------------
-- Primary Key structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."menu"
-- ----------------------------
ALTER TABLE "public"."menu" ADD FOREIGN KEY ("menu_id") REFERENCES "public"."menu" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."rolmenu"
-- ----------------------------
ALTER TABLE "public"."rolmenu" ADD FOREIGN KEY ("menu_id") REFERENCES "public"."menu" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."rolmenu" ADD FOREIGN KEY ("rol_id") REFERENCES "public"."rol" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."usuario"
-- ----------------------------
ALTER TABLE "public"."usuario" ADD FOREIGN KEY ("rol_id") REFERENCES "public"."rol" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
