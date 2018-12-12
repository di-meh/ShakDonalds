<?php
require_once'vue_joueur.php';
require_once'modele_joueur.php';

class ContJoueur{
	private $vuejoueur;
	private $modelejoueur;

	public function __construct(){
		$this->vuejoueur = new VueJoueur();
		$this->modelejoueur = new ModeleJoueur();

		if(!isset($_GET['action'])){
			$_GET['action']='co';
		}
		switch($_GET['action']){
			case 'co' : $this -> connexion();
			break;
			case 'deco' : $this -> deconnexion();
			break;
			case 'nouveau' : $this -> vuejoueur ->affichageNouv();
			break;
			case 'menu' : 
				if(isset($_SESSION['idJ'])){
					require_once'mod_menu/mod_menu.php';
					$module = new ModMenu();
				}
				else{
					$this -> connexion();
				}	

				
			break;

		} 
	}

	public function connexion(){
		$this-> vuejoueur -> affichageCo();
		$this -> modelejoueur -> testco();
	}

	public function deconnexion(){
		$this-> vuejoueur -> affichageCo();
		$this -> modelejoueur -> deco();
	}

	

	
}