<?php
require_once'vue_admin.php';
require_once'modele_admin.php';
require_once'cont_generique.php';

class ContAdmin extends ContGenerique{

	private $modeleadmin;

	public function __construct(){
		$this->vue = new VueAdmin();
		$this->modeleadmin = new ModeleAdmin();

		if(!isset($_GET['action'])){
			$_GET['action']='co';
		}
		switch($_GET['action']){
			case 'co' : $this -> connexion();
			break;
			case 'deco' : $this -> deconnexion();
			break;
			case 'menu' : 
				if(isset($_SESSION['idJ'])){
					$this -> affichage();
				}
				else{
					$this -> connexion();
				}	
				
			break;
			case 'ajoutingredient' :
				$this -> ajouti();
				break;
			case 'ajoutmachine':
				$this -> ajoutm();
				break;
			case 'suppringredient' :
				$this -> suppri();
				break;
			case 'supprmachine' :
				$this -> supprm();
				break;

		} 
	}

	public function ajouti(){
		$this -> vue -> formajouti();
		$this -> modeleadmin -> ajouti();
	}

	public function ajoutm(){
		$this -> vue -> formajoutm();
		$this -> modeleadmin -> ajoutm();
	}

	public function suppri(){
		$this -> vue -> suppri();
		$this -> modeleadmin ->suppri();
	}

	public function supprm(){
		$this -> vue -> supprm();
		$this -> modeleadmin -> supprm();
	}

	public function connexion(){
		$this-> vue -> affichageCo();
		$this -> modeleadmin -> testco();
	}

	public function deconnexion(){
		$this-> vue -> affichageCo();
		$this -> modeleadmin -> deco();
	}

	public function affichage(){
		$this-> vue->affichage();
	}
}

?>