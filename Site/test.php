<?php
session_start();
require_once 'connexion.php';

class BaseDeDonnees extends Connexion{

	public function __construct(){
		$identifiant = $_SESSION['idJ'];
	}

	public function nbrDeCouverts($nb){
		self::$bdd->query('update partie set nbrCouverts = nbrCouverts + $nb where partie.idJ = $identifiant');
	}

	public function recetteTotal($r){
		self::$bdd -> query ('update partie set recetteTotal = recetteTotal + $r where partie.idJ = $identifiant');
	}

	public function prixAliments($p) {
		self::$bdd -> query('update partie set prixAliments = prixAliments + $p where partie.idJ = $identifiant');
	}

	public function perte($p) {
		self::$bdd -> query ('update partie set pertes = pertes + $p where partie.idJ = $identifiant');
	}

	public function tips($t) {
		self::$bdd -> query ('update partie set tips = tips + $t where partie.idJ = $identifiant');
	}

	public function bonus($b) {
		self::$bdd -> query ('update partie set bonus = bonus + $b where partie.idJ = $identifiant');
	}

	public function totalArgent(){
		$recette = self::$bdd -> query('select recetteTotal from partie where partie.idJ= $identifiant');
		$prixaliments = self::$bdd -> query ('select prixAliments from partie where partie.idJ = $identifiant');
		$pertes = self::$bdd -> query ('select ');
		$total = $recette - $prixaliments - $pertes;
		self::$bdd -> query('update partie set totalArgent = $total where partie.idJ =$identifiant');
	}

	public function totalXp(){
		$xp = self::$bdd -> query('select xp from partie where partie.idJ = $identifiant');
		$bonus = self::$bdd -> query('select bonus from partie where partie.idJ = $identifiant');
		self::$bdd -> query ('update partie set totalXp = $xp + $bonus where partie.idJ = $identifiant');
	}

	public function ajouterXP($xp){
		$updatexp = self::$bdd->query('update joueurs set xpJ = xpJ + $xp where idJ = $identifiant');
	}

	public function calculeNiveau(){
		$niveau = self::$bdd -> query ('select max(idN) from niveaux natural join joueurs where niveaux.xpMinN <= joueurs.xpJ');
		$insereniveau = self::$bdd -> query ('update joueurs set idN = $niveau[0] where idJ = $identifiant');
	}

	public function stockIngredient(){
		for(int i=1; i<=16; i++){
			$ingredient = i;
			$nivingredient = self::$bdd -> query ('select idN from ingredients where idI=$ingredient');
			$niveaujoueur = self::$bdd -> query ('select idN from joueurs where idJ = $identifiant');
			if($nivingredient <= $niveaujoueur){
				$remplistockingredient = self::$bdd -> query ('insert into StockIngredient values ($identifiant, $ingredient )');
			}
		}
	}

	public function stockMachine(){
		for(int i=1; i<=6; i++){
			$machine = i;
			$niveaumachine = self::$bdd -> query ('select idN from machines where idM = $machine');
			$niveaujoueur = self::$bdd -> query ('select idN from joueurs where idJ = $identifiant');
			if($niveaumachine <= $niveaujoueur){
				$remplistockmachine = self::$bdd -> query ('insert into StockMachine values ($identifiant, $machine, false)');
			}
		}
	}
}
?>