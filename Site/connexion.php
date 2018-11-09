<?php
class Connexion {
	protected static $bdd;
	public static function initConnexion(){
		self::$bdd = new PDO('pgsql:host=database-etudiants.iut.univ-paris8.fr/phpmyadmin', 'dutinfopw201636', 'neqeragy');
		/*echo 'Connexion échouée :' . */
	}


}