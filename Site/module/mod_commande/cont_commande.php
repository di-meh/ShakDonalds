<?php
require_once'modele_commande.php';
require_once'cont_generique.php';

class ContCommande extends ContGenerique{

	private $modelecommande;

	public function __construct(){
		$this->modelecommande = new ModeleCommande();

		if(!isset($_GET['action'])){
			$_GET['action']='random';
		}
		switch($_GET['action']){
			case 'random' : $this -> random();
			break;
		} 
	}

	public function random(){
		$this -> modelecommande -> random();
	}
}

?>