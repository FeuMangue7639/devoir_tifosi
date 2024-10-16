-- Création de la base de données 'tifosi'
CREATE DATABASE tifosi;

-- Utilisation de la base de données 'tifosi'
USE tifosi;

-- Création de l'utilisateur 'tifosi' avec les droits administratifs
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;


-- Table 'client'
CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom_client VARCHAR(45) NOT NULL,
    age INT,
    cp_client INT
);

-- Table 'focaccia'
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom_focaccia VARCHAR(45) NOT NULL,
    prix_focaccia FLOAT
);

-- Table 'ingredient'
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom_ingredient VARCHAR(45) NOT NULL
);

-- Table 'comprend' 
CREATE TABLE comprend (
    id_focaccia INT,
    id_ingredient INT,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- Table 'boisson'
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(45) NOT NULL
);

-- Table 'marque'
CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(45) NOT NULL
);

-- Table 'appartient' 
CREATE TABLE appartient (
    id_boisson INT,
    id_marque INT,
    PRIMARY KEY (id_boisson, id_marque),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- Table 'menu'
CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom_menu VARCHAR(45) NOT NULL,
    prix_menu FLOAT
);

-- Table 'contient' 
CREATE TABLE contient (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

-- Table 'paye' 
CREATE TABLE paye (
    id_client INT,
    id_menu INT,
    jour DATE,
    PRIMARY KEY (id_client, id_menu, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

-- Table 'achete' 
CREATE TABLE achete (
    id_client INT,
    id_focaccia INT,
    jour DATE,
    PRIMARY KEY (id_client, id_focaccia, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);
