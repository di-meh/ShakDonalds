drop table if exists joueurs;
create or replace table joueurs (idJoueur int, loginJoueur text unique, mdpJoueur text, pseudoJoueur varchar(20), argentJoueur int, niveauJoueur int, constraint pk_joueurs PRIMARY KEY (idJoueur));
insert into joueurs values(default, 'admin', 'admin', 'administrateur', 0);

drop table if exists ingredients;
create or replace table ingredients (idIngr int, nomIngr varchar(32), prixIngr int, descIngr text, debloquer int, constraint pk_ingredients PRIMARY KEY (idIngr));
insert into ingredients values();

drop table if exists machines;
create or replace table machines (idMachine int, nomMachine varchar(32), prixMachine int, descMachine text, debloquer int, constraint pk_machines PRIMARY KEY (idMachine));
insert into machines values();

drop table if exists stockMachine;
create or replace table stockMachine (idStockm int, idMachine int, constraint pk_stockmachine PRIMARY KEY (idStockm), constraint fk_stockmachine FOREIGN KEY (idMachine) references machines(idMachine));
insert into stockMachine values();

drop table if exists stockIngredient;
create or replace table stockIngredient (idStocki int, idIngr int, constraint pk_stockingredient PRIMARY KEY (idStocki), constraint fk_stockingredient FOREIGN KEY (idIngr) references ingredients(idIngr));
insert into stockIngredient values();

drop table if exists niveau;
create or replace table niveau (idNiveau int, niveau int, constraint pk_niveau PRIMARY KEY (idNiveau));


drop function if exists insertionNiveau();
create or replace function insertionNiveau() returns void as $$
	for(int i=1; i<20; i++)
insert into niveau values(default, 1);
insert into niveau values(default, 2);
insert into niveau values(default, 3);
insert into niveau values(default, 4);
insert into niveau values(default, 5);
insert into niveau values(default, 6);
insert into niveau values(default, 7);
insert into niveau values(default, 8);
insert into niveau values(default, 9);
insert into niveau values(default, 10);

