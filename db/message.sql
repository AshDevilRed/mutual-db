CREATE TABLE API(
   id_api INT AUTO_INCREMENT,
   type VARCHAR(50),
   doc VARCHAR(50),
   PRIMARY KEY(id_api)
);

CREATE TABLE Service(
   id INTEGER AUTO_INCREMENT,
   protocole VARCHAR(50),
   port INTEGER,
   version VARCHAR(50),
   etat BOOLEAN,
   PRIMARY KEY(id)
);

CREATE TABLE Certificat(
   id_certif INTEGER AUTO_INCREMENT,
   date_crea VARCHAR(15),
   orga_deliv VARCHAR(50),
   date_exp VARCHAR(15),
   PRIMARY KEY(id_certif)
);

CREATE TABLE Conf_Site(
   id_cs INTEGER AUTO_INCREMENT,
   framework VARCHAR(50),
   langage VARCHAR(50),
   cms VARCHAR(50),
   PRIMARY KEY(id_cs)
);

CREATE TABLE Plugin(
   id INTEGER AUTO_INCREMENT,
   nom VARCHAR(50),
   version VARCHAR(50),
   url VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE Memo(
   id INTEGER AUTO_INCREMENT,
   data LONGTEXT,
   PRIMARY KEY(id)
);

CREATE TABLE CVE(
   id_cve INTEGER AUTO_INCREMENT,
   date_parution VARCHAR(15),
   url_doc VARCHAR(50),
   PRIMARY KEY(id_cve)
);

CREATE TABLE Site(
   id_site INTEGER AUTO_INCREMENT,
   nom VARCHAR(50),
   id_cs INTEGER,
   PRIMARY KEY(id_site),
   FOREIGN KEY(id_cs) REFERENCES Conf_Site(id_cs)
);

CREATE TABLE Spec_Server(
   id_server INTEGER AUTO_INCREMENT,
   localisation VARCHAR(50),
   version_os VARCHAR(50),
   ip VARCHAR(50),
   type_server VARCHAR(50),
   type_db VARCHAR(50),
   id INTEGER,
   PRIMARY KEY(id_server),
   FOREIGN KEY(id) REFERENCES Service(id)
);

CREATE TABLE Possede(
   id_site INTEGER,
   id_certif INTEGER,
   PRIMARY KEY(id_site, id_certif),
   FOREIGN KEY(id_site) REFERENCES Site(id_site),
   FOREIGN KEY(id_certif) REFERENCES Certificat(id_certif)
);

CREATE TABLE comporte(
   id_cs INTEGER,
   id INTEGER,
   PRIMARY KEY(id_cs, id),
   FOREIGN KEY(id_cs) REFERENCES Conf_Site(id_cs),
   FOREIGN KEY(id) REFERENCES Plugin(id)
);

CREATE TABLE Peut_Avoir(
   id_site INTEGER,
   id INTEGER,
   PRIMARY KEY(id_site, id),
   FOREIGN KEY(id_site) REFERENCES Site(id_site),
   FOREIGN KEY(id) REFERENCES Memo(id)
);

CREATE TABLE Contient(
   id_site INTEGER,
   id_server INTEGER,
   PRIMARY KEY(id_site, id_server),
   FOREIGN KEY(id_site) REFERENCES Site(id_site),
   FOREIGN KEY(id_server) REFERENCES Spec_Server(id_server)
);

CREATE TABLE Utilise(
   id_server INTEGER,
   id_api INTEGER,
   PRIMARY KEY(id_server, id_api),
   FOREIGN KEY(id_server) REFERENCES Spec_Server(id_server),
   FOREIGN KEY(id_api) REFERENCES API(id_api)
);

CREATE TABLE A_Une3(
   id INTEGER,
   id_cve INTEGER,
   PRIMARY KEY(id, id_cve),
   FOREIGN KEY(id) REFERENCES Plugin(id),
   FOREIGN KEY(id_cve) REFERENCES CVE(id_cve)
);

CREATE TABLE A_Une(
   id_cs INTEGER,
   id_cve INTEGER,
   PRIMARY KEY(id_cs, id_cve),
   FOREIGN KEY(id_cs) REFERENCES Conf_Site(id_cs),
   FOREIGN KEY(id_cve) REFERENCES CVE(id_cve)
);

CREATE TABLE A_Une2(
   id_server INTEGER,
   id_cve INTEGER,
   PRIMARY KEY(id_server, id_cve),
   FOREIGN KEY(id_server) REFERENCES Spec_Server(id_server),
   FOREIGN KEY(id_cve) REFERENCES CVE(id_cve)
);

CREATE TABLE A_Une4(
   id INTEGER,
   id_cve INTEGER,
   PRIMARY KEY(id, id_cve),
   FOREIGN KEY(id) REFERENCES Service(id),
   FOREIGN KEY(id_cve) REFERENCES CVE(id_cve)
);
