<?php
require_once'index.php';
require_once'module/mod_joueur/cont_joueur.php';
require_once 'mod_generique.php';

class ModJoueur extends ModGenerique{

	public function __construct(){
		$this -> contr = new ContJoueur();
	}
	

}