<?php
require_once'index.php';
require_once'module/mod_joueur/cont_joueur.php';

class ModJoueur{
	private $cont;

	public function __construct(){
		$this->cont = new ContJoueur();
	}
	

}