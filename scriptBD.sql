drop table if exists joueurs cascade;
drop table if exists ingredients cascade;
drop table if exists catIngredients cascade;
drop table if exists machines cascade;
drop table if exists stockMachine cascade;
drop table if exists stockIngredient cascade;
drop table if exists niveaux cascade;

--Niveaux
create table niveaux (idN int UNIQUE, nomN varchar(64), xpMinN int, constraint pk_niveau PRIMARY KEY (idN));
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


--Catégories d'ingrédients
create table catIngredients (idC int UNIQUE, nomC varchar(32), descC varchar(32), constraint pk_catIngredients PRIMARY KEY (idC));
insert into catIngredients values(1, 'Viandes', 'Toutes les viandes/poissons...');
insert into catIngredients values(2, 'Legumes', 'Toutes les légumes...');
insert into catIngredients values(3, 'Boissons', 'Les boissons...');
insert into catIngredients values(4, 'Sauces', 'Toutes les sauces...');
insert into catIngredients values(5, 'Desserts', 'Les désserts...');
insert into catIngredients values(6, 'Patates', 'Pommes de terre');
insert into catIngredients values(7, 'Pain', 'Pain...');
insert into catIngredients values(8, 'Fromage', 'Toutes les fromages...');


--Ingredients
create table ingredients (idI int UNIQUE, nomI varchar(32), prixI float, descI text, idN int, idC int,  constraint pk_ingredients PRIMARY KEY (idI), constraint fk_ingredients_idn FOREIGN KEY (idN) references niveaux(idN), constraint fk_ingredients FOREIGN KEY (idC) references catIngredients(idC));
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
create table machines (idM int UNIQUE, nomM varchar(32), prixM float, entretienM float, descM text, idN int, constraint pk_machines PRIMARY KEY (idM), constraint fk_machines FOREIGN KEY (idN) references niveaux(idN));
insert into machines values(1, 'Friteuse', 0, 9, 'Machine pour cuire frites', 1);
insert into machines values(2, 'Grill', 0, 9, 'Cuisson des viandes', 1);
insert into machines values(3, 'Machine à boissons', 0, 9, 'Machine pour préparer boissons', 1);
insert into machines values(4, 'Machine desserts', 2000, 9, 'Machine pour préparer glaces...', 10);
insert into machines values(5, 'Machine cocktails', 1000, 9, 'Machine pour préparer cocktails', 10);
insert into machines values(6, 'Paneur', 500, 9, 'Machine pour cuire poulet et nuggets', 6);

--Joueurs
create table joueurs (idJ int, loginJ text unique, passwordJ text, pseudoJ varchar(20), argentJ int, idN int, xpJ int, constraint pk_joueurs PRIMARY KEY (idJ), constraint fk_joueurs FOREIGN KEY (idN) references niveaux(idN));

insert into joueurs values(1, 'admin', 'admin', 'administrateur', 0, 1, 1000);
insert into joueurs values(2, 'test', 'test', 'test', 0, 1, 1000);


--Machines débloquées/en stock (débloquées se dedans et possédées si true)
create table stockMachine (idJ int, idM int, possede boolean, constraint pk_stockMachine PRIMARY KEY (idJ, idM), constraint fk_stockMachine_idM FOREIGN KEY(idM) references machines(idM), constraint fk_stockMachine_idJ FOREIGN KEY(idJ) references joueurs(idJ));


--Ingredients débloqués(donc utilisables si dedans)
create table stockIngredient (idJ int, idI int, constraint pk_stockIngredient PRIMARY KEY (idJ, idI), constraint fk_stockIngredient_idJ FOREIGN KEY (idJ) references joueurs(idJ), constraint fk_stockIngredient_didI FOREIGN KEY(idI) references ingredients(idI));


drop function if exists niveauJoueur() cascade;
create or replace function niveauJoueur() returns trigger as $$
declare niveau integer:=0;
begin
	select max(idN) from niveaux into NEW.idN where NEW.xpJ >= niveaux.xpMinN;
	return NEW;
end;
$$ language 'plpgsql';

create trigger trig_niveauJoueur before update or insert on joueurs for row execute procedure niveauJoueur();

drop function if exists debloquerIngredients() cascade;
create or replace function debloquerIngredients() returns trigger as $$
declare id int;
begin
	for i in 1 .. 16 LOOP
		select idN from ingredients into id where idI=i;
		if id <= NEW.idN then
			insert into stockIngredient values (NEW.idJ,i);
		end if;
	end loop;
	return NEW;
end;
$$language 'plpgsql';
create trigger trig_debloquerIngredients before update or insert on joueurs for row execute procedure debloquerIngredients();

drop function if exists debloquerMachines() cascade;
create or replace function debloquerMachines() returns trigger as $$
declare id int;
begin
	for i in 1 .. 6 LOOP
		select idN from machines into id where idM=i;
		if id <= NEW.idN then
			insert into stockMachine values (NEW.idJ,i,false);
		end if;
	end loop;
	return NEW;
end;
$$language 'plpgsql';
create trigger trig_debloquerMachines before update or insert on joueurs for row execute procedure debloquerMachines();


