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
  [fecha del evento] DATE NOT NULL DEFAULT '0000-00-00',
  [hora del evento] TIME DEFAULT NULL,
  [descripción del evento] TEXT NOT NULL,
  [archivo gráfico del evento] TEXT NULL,
  [archivo con detalles] TEXT NULL,
  [url] VARCHAR(120) NULL, -- donde acceder al evento
  [periodicidad] CHAR(1) NULL,
  [estado del evento] CHAR(1) DEFAULT '0',
  -- idCuentaSistema varchar(32)  DEFAULT '',
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