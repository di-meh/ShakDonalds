//Prototype de la partie modèle du jeu
//Pas encore implémenté la partie PHP
	var Joueur = {
		init: function (nom) {
			this.nom = nom;
			this.argent = 100;
			this.niveau = 1;
			this.xp = 0;
		}
	}

	var Ingrédient = {
		init: function(nom, prix) {
			this.nom = nom;
			this.prix = prix;
			//this.descIngr = <?php>
			//this.debloquer
		}
	}

	var Machine = {
		init: function(nom, prix) {
			this.nom = nom;
			this.prix = prix;
			//this.descIngr = <?php>
			//this.debloquer
		}
	}	

