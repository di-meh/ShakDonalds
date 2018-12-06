#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
use dutinfopw201636;
drop table if exists StockMachine cascade;
drop table if exists StockIngredient cascade;
drop table if exists ingredients cascade;
drop table if exists catIngredients cascade;
drop table if exists machines cascade;
drop table if exists partie cascade;
drop table if exists joueurs cascade;
drop table if exists niveaux cascade;

#------------------------------------------------------------
# Table: Joueurs
#------------------------------------------------------------

CREATE TABLE joueurs(
        idJ       int (11) Auto_increment  NOT NULL ,
        loginJ    Varchar (25) ,
        passwordJ Varchar (25) ,
        pseudoJ   Varchar (16) ,
        argentJ   Float ,
        xpJ       Integer ,
        idN       Int ,
        PRIMARY KEY (idJ ) ,
        UNIQUE (loginJ )
)ENGINE=InnoDB;
insert into joueurs values(1, 'admin', 'admin', 'administrateur', 0, 1000, 1);

#------------------------------------------------------------
# Table: StockMachine
#------------------------------------------------------------

CREATE TABLE StockMachine(
        idJ          Integer NOT NULL ,
        idM          Integer NOT NULL ,
        possedeM     Bool ,
        idJ_Joueurs  Int NOT NULL ,
        idM_Machines Int ,
        PRIMARY KEY (idJ ,idM )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: StockIngredient
#------------------------------------------------------------

CREATE TABLE StockIngredient(
        idJ             Integer NOT NULL ,
        idI             Integer NOT NULL ,
        idJ_Joueurs     Int NOT NULL ,
        idI_Ingredients Int ,
        PRIMARY KEY (idJ ,idI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredients
#------------------------------------------------------------

CREATE TABLE ingredients(
        idI   int (11) Auto_increment  NOT NULL ,
        nomI  Varchar (25) ,
	prixI Float ,
        descI Text ,
        idN   Int ,
        idC   Int ,
        PRIMARY KEY (idI )
)ENGINE=InnoDB;
insert into ingredients values(1, 'Salades', 0.5, 'La bonne salade sa mère', 1, 2);
insert into ingredients values(2, 'Steak', 2, 'Bon steak', 1, 1);
insert into ingredients values(3, 'Poulet', 2, 'Miam', 6, 1);
insert into ingredients values(4, 'Frites', 1, 'Dose de frites', 1, 6);
insert into ingredients values(5, 'Potatoes', 1, 'Dose de potatoes', 7, 6);
insert into ingredients values(6, 'Bacon', 1.5, 'Tranche de bacon', 7, 1);
insert into ingredients values(7, 'Pain', 1, '2 tranches de pain', 1, 7);
insert into ingredients values(8, 'Tomates', 0.5, 'Dose tomates', 1, 2);
insert into ingredients values(9, 'Oignons', 0.5, 'Dose oignon', 1, 2);
insert into ingredients values(10, 'Fromage', 1, 'Tranche de fromage', 1, 8);
insert into ingredients values(11, 'Soda', 1, 'Boissons', 1, 3);
insert into ingredients values(12, 'Vodka du supermarché', 2, 'Un petit shnaps ?', 1, 3);
insert into ingredients values(13, 'Absolute vodka', 2, 'Vodka gastronomique', 16, 3);
insert into ingredients values(14, 'Lait milkshake/glaces', 1, 'Dose pour une glace', 10, 5);
insert into ingredients values(15, 'Steak végétarien', 1.5, 'Pour les fragiles...', 10, 1);
insert into ingredients values(16, 'Poisson', 2, 'Il est frais mon poisson', 10, 1);

#------------------------------------------------------------
# Table: CategoriesIngredients
#------------------------------------------------------------

CREATE TABLE catIngredients(
        idC   int (11) Auto_increment  NOT NULL ,
        nomC  Varchar (25) ,
        descC Text ,
        PRIMARY KEY (idC )
)ENGINE=InnoDB;
insert into catIngredients values(1, 'Viandes', 'Toutes les viandes/poissons...');
insert into catIngredients values(2, 'Legumes', 'Toutes les légumes...');
insert into catIngredients values(3, 'Boissons', 'Les boissons...');
insert into catIngredients values(4, 'Sauces', 'Toutes les sauces...');
insert into catIngredients values(5, 'Desserts', 'Les désserts...');
insert into catIngredients values(6, 'Patates', 'Pommes de terre');
insert into catIngredients values(7, 'Pain', 'Pain...');
insert into catIngredients values(8, 'Fromage', 'Toutes les fromages...');

#------------------------------------------------------------
# Table: Niveaux
#------------------------------------------------------------

CREATE TABLE niveaux(
        idN    int (11) Auto_increment  NOT NULL ,
        nomN   Varchar (64) ,
        xpminN Integer ,
        PRIMARY KEY (idN )
)ENGINE=InnoDB;
insert into niveaux values(1, 'Apprenti', 0);
insert into niveaux values(2, 'Apprenti+', 10);
insert into niveaux values(3, 'Apprenti++', 30);
insert into niveaux values(4, 'Petit cuistot', 100);
insert into niveaux values(5, 'Petit cuistot+', 300);
insert into niveaux values(6, 'Petit cuistot++', 600);
insert into niveaux values(7, 'Cuistot', 1000);
insert into niveaux values(8, 'Cuistot+', 1500);
insert into niveaux values(9, 'Cuistot++', 2200);
insert into niveaux values(10, 'Petit chef', 3000);
insert into niveaux values(11, 'Petit chef+', 4000);
insert into niveaux values(12, 'Petit chef++', 5500);
insert into niveaux values(13, 'Chef cuistot', 7500);
insert into niveaux values(14, 'Chef cuistot+', 10000);
insert into niveaux values(15, 'Chef cuistot++', 13000);
insert into niveaux values(16, 'Grand chef cuistot', 17000);
insert into niveaux values(17, 'Grand chef cuistot+', 22000);
insert into niveaux values(18, 'Grand chef cuistot++', 29000);
insert into niveaux values(19, 'Grand chef cuistot étoilé: *', 38000);
insert into niveaux values(20, 'Grand chef cuistot étoilé: **', 50000);
insert into niveaux values(21, 'Grand chef cuistot étoilé: ***', 70000);
insert into niveaux values(22, 'Grand chef cuistot étoilé: ****', 100000);
insert into niveaux values(23, 'Grand chef cuistot étoilé: *****', 150000);

#------------------------------------------------------------
# Table: Machines
#------------------------------------------------------------

CREATE TABLE machines(
        idM        int (11) Auto_increment  NOT NULL ,
        nomM       Varchar (25) ,
        prixM      Float ,
        entretienM Float ,
        descM      Text ,
        idN        Int ,
        PRIMARY KEY (idM )
)ENGINE=InnoDB;
insert into machines values(1, 'Friteuse', 0, 9, 'Machine pour cuire frites', 1);
insert into machines values(2, 'Grill', 0, 9, 'Cuisson des viandes', 1);
insert into machines values(3, 'Machine à boissons', 0, 9, 'Machine pour préparer boissons', 1);
insert into machines values(4, 'Machine desserts', 2000, 9, 'Machine pour préparer glaces...', 10);
insert into machines values(5, 'Machine cocktails', 1000, 9, 'Machine pour préparer cocktails', 10);
insert into machines values(6, 'Paneur', 500, 9, 'Machine pour cuire poulet et nuggets', 6);

#------------------------------------------------------------
# Table: Partie
#------------------------------------------------------------

CREATE TABLE partie(
        idP          int (11) Auto_increment  NOT NULL ,
        nbrCouverts  Integer ,
        prixAliments Integer ,
        pertes       Integer ,
        tips         Integer ,
        sousTotal    Integer ,
        bonus        Integer ,
        total        Integer ,
        idJ          Int NOT NULL ,
        PRIMARY KEY (idP ) ,
	UNIQUE (idJ)
)ENGINE=InnoDB;
insert into partie values (1, 0, 0, 0, 0, 0, 0, 0, 1);

ALTER TABLE joueurs ADD CONSTRAINT FK_Joueurs_idN FOREIGN KEY (idN) REFERENCES niveaux(idN);
ALTER TABLE StockMachine ADD CONSTRAINT FK_StockMachine_idJ_Joueurs FOREIGN KEY (idJ_Joueurs) REFERENCES joueurs(idJ);
ALTER TABLE StockMachine ADD CONSTRAINT FK_StockMachine_idM_Machines FOREIGN KEY (idM_Machines) REFERENCES machines(idM);
ALTER TABLE StockIngredient ADD CONSTRAINT FK_StockIngredient_idJ_Joueurs FOREIGN KEY (idJ_Joueurs) REFERENCES joueurs(idJ);
ALTER TABLE StockIngredient ADD CONSTRAINT FK_StockIngredient_idI_Ingredients FOREIGN KEY (idI_Ingredients) REFERENCES ingredients(idI);
ALTER TABLE ingredients ADD CONSTRAINT FK_Ingredients_idC FOREIGN KEY (idC) REFERENCES catIngredients(idC);
ALTER TABLE ingredients ADD CONSTRAINT FK_Ingredients_idN FOREIGN KEY (idN) REFERENCES niveaux(idN);
ALTER TABLE machines ADD CONSTRAINT FK_Machines_idN FOREIGN KEY (idN) REFERENCES niveaux(idN);
ALTER TABLE partie ADD CONSTRAINT FK_Partie_idJ FOREIGN KEY (idJ) REFERENCES joueurs(idJ);
