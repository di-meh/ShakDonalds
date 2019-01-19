<?php
require_once'vue_joueur.php';
require_once'modele_joueur.php';
require_once'cont_generique.php';

class ContJoueur extends ContGenerique{

	private $modelejoueur;

	public function __construct(){
		$this->modelejoueur = new ModeleJoueur();
		$this->vue = new VueJoueur();

		if(!isset($_GET['action'])){
			$_GET['action']='co';
		}
		switch($_GET['action']){
			case 'co' : $this -> connexion();
			break;
			case 'deco' : $this -> deconnexion();
			break;
			case 'nouveau' : $this -> nouveauJoueur();
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
			case 'boutique' : 
				$this -> boutique();
			break;

		} 
	}

	public function connexion(){
		$this-> vue -> affichageCo();
		$this -> modelejoueur -> testco();
	}

	public function deconnexion(){
		$this-> vue-> affichageCo();
		$this -> modelejoueur -> deco();
	}

	public function nouveauJoueur(){
		$this -> vue -> affichageForm();
		$num=$this -> modelejoueur -> inscription();
			
		
	}

	public function boutique(){
		$this -> vue -> affichageBoutique();
	}
/*
	public function affichage(){
		return $this-> vuejoueur->affichageCo();
	}
*/

	
}