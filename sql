-- Generado por Oracle SQL Developer Data Modeler 4.0.3.853
--   en:        2014-11-26 13:05:38 CET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE
  TABLE ALQUILER
  (
    FECHA_ALQUILER UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    UNIDADES UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    FECHA_FINAL_DEVOLUCION UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    ,
    ARMAS_DE_FUEGO_ID_PRODUCTO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    CLIENTE_DNI UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL
  ) ;
ALTER TABLE ALQUILER ADD CONSTRAINT ALQUILER_PK PRIMARY KEY ( FECHA_ALQUILER,
ARMAS_DE_FUEGO_ID_PRODUCTO, CLIENTE_DNI ) ;

CREATE
  TABLE ARMAS_DE_FUEGO
  (
    ID_PRODUCTO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    NOMBRE UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    PVP UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
  ) ;
ALTER TABLE ARMAS_DE_FUEGO ADD CONSTRAINT ARMAS_DE_FUEGO_PK PRIMARY KEY (
ID_PRODUCTO ) ;
ALTER TABLE ARMAS_DE_FUEGO ADD CONSTRAINT ARMAS_DE_FUEGO__UN UNIQUE ( NOMBRE )
;

CREATE
  TABLE CLIENTE
  (
    DNI UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    NOMBRE UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    ,
    EDAD UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
  ) ;
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( DNI ) ;

CREATE
  TABLE FACTURA
  (
    NUMERO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    RECIBO_NUMERO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    LIQUIDACION_NUMERO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL
  ) ;
CREATE UNIQUE INDEX FACTURA__IDX ON FACTURA
  (
    RECIBO_NUMERO ASC
  )
  ;
  ALTER TABLE FACTURA ADD CONSTRAINT FACTURA_PK PRIMARY KEY ( NUMERO ) ;

CREATE
  TABLE LIQUIDACION
  (
    NUMERO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    TRIMESTE UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    ,
    FECHA UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
  ) ;
ALTER TABLE LIQUIDACION ADD CONSTRAINT LIQUIDACION_PK PRIMARY KEY ( NUMERO ) ;

CREATE
  TABLE RECIBO
  (
    NUMERO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    TOTAL UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    ALQUILER_FECHA_ALQUILER UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    --  ERROR: Column name length exceeds maximum allowed length(30)
    ALQUILER_ARMAS_DE_FUEGO_ID_PRODUCTO UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL ,
    ALQUILER_CLIENTE_DNI UNKNOWN
    --  ERROR: Datatype UNKNOWN is not allowed
    NOT NULL
  ) ;
CREATE UNIQUE INDEX RECIBO__IDX ON RECIBO
  (
    ALQUILER_FECHA_ALQUILER ASC , ALQUILER_ARMAS_DE_FUEGO_ID_PRODUCTO ASC ,
    ALQUILER_CLIENTE_DNI ASC
  )
  ;
  ALTER TABLE RECIBO ADD CONSTRAINT RECIBO_PK PRIMARY KEY ( NUMERO ) ;

ALTER TABLE ALQUILER ADD CONSTRAINT ALQUILER_ARMAS_DE_FUEGO_FK FOREIGN KEY (
ARMAS_DE_FUEGO_ID_PRODUCTO ) REFERENCES ARMAS_DE_FUEGO ( ID_PRODUCTO ) ;

ALTER TABLE ALQUILER ADD CONSTRAINT ALQUILER_CLIENTE_FK FOREIGN KEY (
CLIENTE_DNI ) REFERENCES CLIENTE ( DNI ) ;

ALTER TABLE FACTURA ADD CONSTRAINT FACTURA_LIQUIDACION_FK FOREIGN KEY (
LIQUIDACION_NUMERO ) REFERENCES LIQUIDACION ( NUMERO ) ;

ALTER TABLE FACTURA ADD CONSTRAINT FACTURA_RECIBO_FK FOREIGN KEY (
RECIBO_NUMERO ) REFERENCES RECIBO ( NUMERO ) ;

ALTER TABLE RECIBO ADD CONSTRAINT RECIBO_ALQUILER_FK FOREIGN KEY (
ALQUILER_FECHA_ALQUILER, ALQUILER_ARMAS_DE_FUEGO_ID_PRODUCTO,
ALQUILER_CLIENTE_DNI ) REFERENCES ALQUILER ( FECHA_ALQUILER,
ARMAS_DE_FUEGO_ID_PRODUCTO, CLIENTE_DNI ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             2
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                  23
-- WARNINGS                                 0
