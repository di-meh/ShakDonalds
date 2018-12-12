<?php
class Connexion {
	protected static $bdd;
	public static function initConnexion(){
		try{
		self::$bdd = new PDO('mysql:host=database-etudiants.iut.univ-paris8.fr;dbname=dutinfopw201636', 'dutinfopw201636', 'neqeragy');
		/*echo 'Connexion échouée :' . */
		/*http://database-etudiants.iut.univ-paris8.fr/phpmyadmin/*/
		}catch(PDOException $e){
			echo $e->getMessage();
		}
	}


}