--Catégories d'ingrédients
drop table if exists catIngredients cascade;
drop table if exists ingredients cascade;
drop table if exists machines cascade;
drop table if exists stockMachine cascade;
drop table if exists stockIngredient cascade;
drop table if exists niveau cascade;
drop table if exists joueurs cascade;

create table catIngredients (idCat int UNIQUE, nomCat varchar(32), descCat varchar(32), constraint pk_catIngredients PRIMARY KEY (idCat));
insert into catIngredients values(1, 'Viandes', 'Toutes les viandes/poissons...');
insert into catIngredients values(2, 'Legumes', 'Toutes les légumes...');
insert into catIngredients values(3, 'Boissons', 'Les boissons...');
insert into catIngredients values(4, 'Sauces', 'Toutes les sauces...');
insert into catIngredients values(5, 'Desserts', 'Les désserts...');
insert into catIngredients values(6, 'Patates', 'Pommes de terre');
insert into catIngredients values(7, 'Pain', 'Pain...');
insert into catIngredients values(8, 'Fromage', 'Toutes les fromages...');


--Ingredients
create table ingredients (idIngr int UNIQUE, nomIngr varchar(32), prixIngr float, descIngr text, debloquer int, idCat int,  constraint pk_ingredients PRIMARY KEY (idIngr), constraint fk_ingredients FOREIGN KEY (idCat) references catIngredients(idCat));

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


--Machines
create table machines (idMachine int UNIQUE, nomMachine varchar(32), prixMachine int, descMachine text, debloquer int, constraint pk_machines PRIMARY KEY (idMachine));

insert into machines values(1, 'Friteuse', 0, 'Machine pour cuire frites', 1);
insert into machines values(2, 'Grill', 0, 'Cuisson des viandes', 1);
insert into machines values(3, 'Machine à boissons', 0, 'Machine pour préparer boissons', 1);
insert into machines values(4, 'Machine desserts', 2000, 'Machine pour préparer glaces...', 10);
insert into machines values(5, 'Machine cocktails', 1000, 'Machine pour préparer cocktails', 10);
insert into machines values(6, 'Paneur', 500, 'Machine pour cuire poulet et nuggets', 6);


--Machines en stock
create table stockMachine (idStockm int UNIQUE, idMachine1 int, idMachine2 int, idMachine3 int, idMachine4 int, idMachine5 int, idMachine6 int, idMachine7 int, constraint pk_stockmachine PRIMARY KEY (idStockm), constraint fk_stockmachine1 FOREIGN KEY (idMachine1) references machines(idMachine), constraint fk_stockmachine2 FOREIGN KEY (idMachine2) references machines(idMachine), constraint fk_stockmachine3 FOREIGN KEY (idMachine3) references machines(idMachine), constraint fk_stockmachine4 FOREIGN KEY (idMachine4) references machines(idMachine), constraint fk_stockmachine5 FOREIGN KEY (idMachine5) references machines(idMachine), constraint fk_stockmachine6 FOREIGN KEY (idMachine6) references machines(idMachine), constraint fk_stockmachine7 FOREIGN KEY (idMachine7) references machines(idMachine));


--Ingredients en stock
create table stockIngredient (idStocki int UNIQUE, idIngr int, constraint pk_stockingredient PRIMARY KEY (idStocki), constraint fk_stockingredient FOREIGN KEY (idIngr) references ingredients(idIngr));

--insert into stockIngredient values();


--Niveaux
create table niveau (idNiveau int UNIQUE, niveau int, nom varchar(64), xp int, constraint pk_niveau PRIMARY KEY (idNiveau));

insert into niveau values(1, 1, 'Apprenti', 0);
insert into niveau values(2, 2, 'Apprenti+', 10);
insert into niveau values(3, 3, 'Apprenti++', 30);
insert into niveau values(4, 4, 'Petit cuistot', 100);
insert into niveau values(5, 5, 'Petit cuistot+', 300);
insert into niveau values(6, 6, 'Petit cuistot++', 600);
insert into niveau values(7, 7, 'Cuistot', 1000);
insert into niveau values(8, 8, 'Cuistot+', 1500);
insert into niveau values(9, 9, 'Cuistot++', 2200);
insert into niveau values(10, 10, 'Petit chef', 3000);
insert into niveau values(11, 11, 'Petit chef+', 4000);
insert into niveau values(12, 12, 'Petit chef++', 5500);
insert into niveau values(13, 13, 'Chef cuistot', 7500);
insert into niveau values(14, 14, 'Chef cuistot+', 10000);
insert into niveau values(15, 15, 'Chef cuistot++', 13000);
insert into niveau values(16, 16, 'Grand chef cuistot', 17000);
insert into niveau values(17, 17, 'Grand chef cuistot+', 22000);
insert into niveau values(18, 18, 'Grand chef cuistot++', 29000);
insert into niveau values(19, 19, 'Grand chef cuistot étoilé: *', 38000);
insert into niveau values(20, 20, 'Grand chef cuistot étoilé: **', 50000);
insert into niveau values(21, 21, 'Grand chef cuistot étoilé: ***', 70000);
insert into niveau values(22, 22, 'Grand chef cuistot étoilé: ****', 100000);
insert into niveau values(23, 23, 'Grand chef cuistot étoilé: *****', 150000);


--Joueurs
create table joueurs (idJoueur int, loginJoueur text unique, mdpJoueur text, pseudoJoueur varchar(20), argentJoueur int, idNiveau int, xpJoueur int, idStockm int, constraint pk_joueurs PRIMARY KEY (idJoueur), constraint fk_joueurs FOREIGN KEY (idNiveau) references niveau(idNiveau), constraint fk_joueurs2 FOREIGN KEY (idStockm) references stockMachine(idStockm));

insert into joueurs values(1, 'admin', 'admin', 'administrateur', 0, 1, 0, NULL);
