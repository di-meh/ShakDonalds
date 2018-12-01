<?php
session_start();
require_once 'connexion.php';

class BaseDeDonnees extends Connexion{

	public function __construct(){
		$identifiant = $_SESSION['idJ'];
	}

	public function ajouterXP($xp){
		$updatexp = $bdd->query('update joueurs set xpJ = xpJ + $xp where idJ = $identifiant');
	}

	public function calculeNiveau(){
		$niveau = $bdd -> query ('select max(idN) from niveaux natural join joueurs where niveaux.xpMinN <= joueurs.xpJ');
		$insereniveau = $bdd -> query ('update joueurs set idN = $niveau[0] where idJ = $identifiant');
	}

	public function stockIngredient(){
		for(int i=1; i<=16; i++){
			$ingredient = i;
			$nivingredient = $bdd -> query ('select idN from ingredients where idI=$ingredient');
			$niveaujoueur = $bdd -> query ('select idN from joueurs where idJ = $identifiant');
			if($nivingredient <= $niveaujoueur){
				$remplistockingredient = $bdd -> query ('insert into StockIngredient values ($identifiant, $ingredient )');
			}
		}
	}

	public function stockMachine(){
		for(int i=1; i<=6; i++){
			$machine = i;
			$niveaumachine = $bdd -> query ('select idN from machines where idM = $machine');
			$niveaujoueur = $bdd -> query ('select idN from joueurs where idJ = $identifiant');
			if($niveaumachine <= $niveaujoueur){
				$remplistockmachine = $bdd -> query ('insert into StockMachine values ($identifiant, $machine, false)');
			}
		}
	}
}
?>