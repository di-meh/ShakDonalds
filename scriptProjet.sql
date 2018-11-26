#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
drop table if exists StockMachine;
drop table if exists StockIngredient;
drop table if exists Ingredients;
drop table if exists CategoriesIngredients;
drop table if exists Machines;
drop table if exists Joueurs;
drop table if exists Niveaux;

#------------------------------------------------------------
# Table: Joueurs
#------------------------------------------------------------

CREATE TABLE Joueurs(
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

CREATE TABLE Ingredients(
        idI   int (11) Auto_increment  NOT NULL ,
        nomI  Varchar (25) ,
        descI Text ,
        prixI Float ,
        idC   Int ,
        PRIMARY KEY (idI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CategoriesIngredients
#------------------------------------------------------------

CREATE TABLE CategoriesIngredients(
        idC   int (11) Auto_increment  NOT NULL ,
        nomC  Varchar (25) ,
        descC Text ,
        PRIMARY KEY (idC )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Niveaux
#------------------------------------------------------------

CREATE TABLE Niveaux(
        idN    int (11) Auto_increment  NOT NULL ,
        nomN   Varchar (64) ,
        xpminN Integer ,
        PRIMARY KEY (idN )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Machines
#------------------------------------------------------------

CREATE TABLE Machines(
        idM        int (11) Auto_increment  NOT NULL ,
        nomM       Varchar (25) ,
        prixM      Float ,
        entretienM Float ,
        descM      Text ,
        PRIMARY KEY (idM )
)ENGINE=InnoDB;

ALTER TABLE Joueurs ADD CONSTRAINT FK_Joueurs_idN FOREIGN KEY (idN) REFERENCES Niveaux(idN);
ALTER TABLE StockMachine ADD CONSTRAINT FK_StockMachine_idJ_Joueurs FOREIGN KEY (idJ_Joueurs) REFERENCES Joueurs(idJ);
ALTER TABLE StockMachine ADD CONSTRAINT FK_StockMachine_idM_Machines FOREIGN KEY (idM_Machines) REFERENCES Machines(idM);
ALTER TABLE StockIngredient ADD CONSTRAINT FK_StockIngredient_idJ_Joueurs FOREIGN KEY (idJ_Joueurs) REFERENCES Joueurs(idJ);
ALTER TABLE StockIngredient ADD CONSTRAINT FK_StockIngredient_idI_Ingredients FOREIGN KEY (idI_Ingredients) REFERENCES Ingredients(idI);
ALTER TABLE Ingredients ADD CONSTRAINT FK_Ingredients_idC FOREIGN KEY (idC) REFERENCES CategoriesIngredients(idC);
