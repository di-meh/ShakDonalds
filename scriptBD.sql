--Catégories d'ingrédients
drop table if exists catIngredients;
create table catIngredients (idCat int NOT NULL, nomCat varchar(32), descCat varchar(32), constraint pk_catIngredients PRIMARY KEY (idCat));
insert into catIngredients values(default, 'Viandes', 'Toutes les viandes/poissons...');
insert into catIngredients values(default, 'Legumes', 'Toutes les légumes...');
insert into catIngredients values(default, 'Boissons', 'Les boissons...');
insert into catIngredients values(default, 'Sauces', 'Toutes les sauces...');
insert into catIngredients values(default, 'Desserts', 'Les désserts...');
insert into catIngredients values(default, 'Patates', 'Pommes de terre');
insert into catIngredients values(default, 'Pain', 'Pain...');
insert into catIngredients values(default, 'Fromage', 'Toutes les fromages...');


--Ingredients
drop table if exists ingredients;
create table ingredients (idIngr int NOT NULL, nomIngr varchar(32), prixIngr float, descIngr text, debloquer int, idCat int,  constraint pk_ingredients PRIMARY KEY (idIngr), constraint fk_ingredients FOREIGN KEY (idCat) references catIngredients(idCat));

insert into ingredients values(default, 'Salades', 0.5, 'La bonne salade sa mère', 1, 2);
insert into ingredients values(default, 'Steak', 2, 'Bon steak', 1, 1);
insert into ingredients values(default, 'Poulet', 2, 'Miam', 6, 1);
insert into ingredients values(default, 'Frites', 1, 'Dose de frites', 1, 6);
insert into ingredients values(default, 'Potatoes', 1, 'Dose de potatoes', 7, 6);
insert into ingredients values(default, 'Bacon', 1.5, 'Tranche de bacon', 7, 1);
insert into ingredients values(default, 'Pain', 1, '2 tranches de pain', 1, 7);
insert into ingredients values(default, 'Tomates', 0.5, 'Dose tomates', 1, 2);
insert into ingredients values(default, 'Oignons', 0.5, 'Dose oignon', 1, 2);
insert into ingredients values(default, 'Fromage', 1, 'Tranche de fromage', 1, 8);
insert into ingredients values(default, 'Soda', 1, 'Boissons', 1, 3);
insert into ingredients values(default, 'Vodka du supermarché', 2, 'Un petit shnaps ?', 1, 3);
insert into ingredients values(default, 'Absolute vodka', 2, 'Vodka gastronomique', 16, 3);
insert into ingredients values(default, 'Lait milkshake/glaces', 1, 'Dose pour une glace', 10, 5);
insert into ingredients values(default, 'Steak végétarien', 1.5, 'Pour les fragiles...', 10, 1);
insert into ingredients values(default, 'Poisson', 2, 'Il est frais mon poisson', 10, 1);


--Machines
drop table if exists machines;
create table machines (idMachine int NOT NULL, nomMachine varchar(32), prixMachine int, descMachine text, debloquer int, constraint pk_machines PRIMARY KEY (idMachine));

insert into machines values(default, 'Friteuse', 0, 'Machine pour cuire frites', 1);
insert into machines values(default, 'Grill', 0, 'Cuisson des viandes', 1);
insert into machines values(default, 'Machine à boissons', 0, 'Machine pour préparer boissons', 1);
insert into machines values(default, 'Machine desserts', 2000, 'Machine pour préparer glaces...', 10);
insert into machines values(default, 'Machine cocktails', 1000, 'Machine pour préparer cocktails', 10);
insert into machines values(default, 'Paneur', 500, 'Machine pour cuire poulet et nuggets', 6);


--Machines en stock
drop table if exists stockMachine;
create or replace table stockMachine (idStockm int NOT NULL, idMachine1 int, idMachine2 int, idMachine3 int, idMachine4 int, idMachine5 int, idMachine6 int, idMachine7 int, constraint pk_stockmachine PRIMARY KEY (idStockm), constraint fk_stockmachine FOREIGN KEY (idMachine1, idMachine2, idMachine3, idMachine4, idMachine5, idMachine6, idMachine7) references machines(idMachine));


--Ingredients en stock
drop table if exists stockIngredient;
create or replace table stockIngredient (idStocki int NOT NULL, idIngr int, constraint pk_stockingredient PRIMARY KEY (idStocki), constraint fk_stockingredient FOREIGN KEY (idIngr) references ingredients(idIngr));

insert into stockIngredient values();


--Niveaux
drop table if exists niveau;
create table niveau (idNiveau int NOT NULL, niveau int, nom varchar(64), xp int constraint pk_niveau PRIMARY KEY (idNiveau));

insert into niveau values(default, 1, 'Apprenti', 0);
insert into niveau values(default, 2, 'Apprenti+', 10);
insert into niveau values(default, 3, 'Apprenti++', 30);
insert into niveau values(default, 4, 'Petit cuistot', 100);
insert into niveau values(default, 5, 'Petit cuistot+', 300);
insert into niveau values(default, 6, 'Petit cuistot++', 600);
insert into niveau values(default, 7, 'Cuistot', 1000);
insert into niveau values(default, 8, 'Cuistot+', 1500);
insert into niveau values(default, 9, 'Cuistot++', 2200);
insert into niveau values(default, 10, 'Petit chef', 3000);
insert into niveau values(default, 11, 'Petit chef+', 4000);
insert into niveau values(default, 12, 'Petit chef++', 5500);
insert into niveau values(default, 13, 'Chef cuistot', 7500);
insert into niveau values(default, 14, 'Chef cuistot+', 10000);
insert into niveau values(default, 15, 'Chef cuistot++', 13000);
insert into niveau values(default, 16, 'Grand chef cuistot', 17000);
insert into niveau values(default, 17, 'Grand chef cuistot+', 22000);
insert into niveau values(default, 18, 'Grand chef cuistot++', 29000);
insert into niveau values(default, 19, 'Grand chef cuistot étoilé: *', 38000);
insert into niveau values(default, 20, 'Grand chef cuistot étoilé: **', 50000);
insert into niveau values(default, 21, 'Grand chef cuistot étoilé: ***', 70000);
insert into niveau values(default, 20, 'Grand chef cuistot étoilé: ****', 100000);
insert into niveau values(default, 20, 'Grand chef cuistot étoilé: *****', 150000);


--Joueurs
drop table if exists joueurs;
create table joueurs (idJoueur int, loginJoueur text unique, mdpJoueur text, pseudoJoueur varchar(20), argentJoueur int, idNiveau int, xpJoueur int, idStockm int, constraint pk_joueurs PRIMARY KEY (idJoueur), constraint fk_joueurs FOREIGN KEY (idNiveau) references niveau(idNiveau), constraint fk_joueurs FOREIGN KEY (idStockm) references stockMachine(idStockm));

insert into joueurs values(default, 'admin', 'admin', 'administrateur', 0, 1, 0, NULL);




