/*
@description Gestión de los Eventos Culturales de la ciudad
@author Luis Carrillo Gutiérrez
@date Mayo, 2025
@version 0.0.1
*/
DROP TABLE IF EXISTS [Categoría Cultural];
CREATE TABLE IF NOT EXISTS [Categoría Cultural]
(
	[id] INTEGER NOT NULL, -- AUTOINCREMENT
	[denominación] VARCHAR(32) NOT NULL,
	PRIMARY KEY (id)
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Evento Cultural];
CREATE TABLE IF NOT EXISTS [Evento Cultural]
(
	[id] INTEGER NOT NULL,
	[título del evento] VARCHAR(128) NOT NULL,
	[descripción del evento] TEXT NOT NULL,
	[url] VARCHAR(120) NULL, -- donde acceder al evento
	[estado del evento] CHAR(1) DEFAULT '0', -- ENUM
	-- idCuentaSistema varchar(32)  DEFAULT '',
	PRIMARY KEY (id)
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Cronograma];
CREATE TABLE IF NOT EXISTS [Cronograma] 
(
	[id] INTEGER NOT NULL,
	[id evento] INTEGER NOT NULL REFERENCES [Evento Cultural](id),
	[fecha comienzo del evento] DATETIME NOT NULL DEFAULT '0000-00-00',
	[fecha final del evento] DATE NOT NULL DEFAULT '0000-00-00',
	-- [hora del evento] TIME DEFAULT NULL,
	[periodicidad] CHAR(1) NULL, -- ENUM
	PRIMARY KEY (id)
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Archivo Adjuntos];
CREATE TABLE IF NOT EXISTS [Archivo Adjuntos] 
(
	[id] INTEGER NOT NULL,
	[id evento] INTEGER NOT NULL REFERENCES [Evento Cultural](id),
	[tipo de archivo] CHAR(1) NULL, -- ENUM
	[archivo adjunto del evento] TEXT NULL,
	[nombre original del archivo] TEXT NULL,
	PRIMARY KEY (id)
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Lugar Cultural];
CREATE TABLE IF NOT EXISTS [Lugar Cultural]
(
	[id] INTEGER NOT NULL,
	[denominación] VARCHAR(128) NOT NULL,
	[dirección] VARCHAR(128) NOT NULL,
	PRIMARY KEY (id)
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Categorias por Evento];
CREATE TABLE IF NOT EXISTS [Categorias por Evento]
(
  [id evento] INTEGER NOT NULL REFERENCES [Evento Cultural](id),
  [id categoría] INTEGER NOT NULL REFERENCES [Categoría Cultural](id),
  PRIMARY KEY ('id evento', 'id categoría')
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Lugares por Evento];
CREATE TABLE IF NOT EXISTS [Lugares por Evento]
(
  [id evento] INTEGER NOT NULL REFERENCES [Evento Cultural](id),
  [id lugar] INTEGER NOT NULL REFERENCES [Lugar Cultural](id),
  PRIMARY KEY ('id evento', 'id lugar')
) WITHOUT ROWID;
