<?php
require_once'vue_admin.php';
require_once'modele_admin.php';

class ContAdmin{
	private $vueadmin;
	private $modeleadmin;

	public function __construct(){
		$this->vueadmin = new VueAdmin();
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
		$this -> vueadmin -> formajouti();
		$this -> modeleadmin -> ajouti();
	}

	public function ajoutm(){
		$this -> vueadmin -> formajoutm();
		$this -> modeleadmin -> ajoutm();
	}

	public function suppri(){
		$this -> vueadmin -> suppri();
		$this -> modeleadmin ->suppri();
	}

	public function supprm(){
		$this -> vueadmin -> supprm();
		$this -> modeleadmin -> supprm();
	}

	public function connexion(){
		$this-> vueadmin -> affichageCo();
		$this -> modeleadmin -> testco();
	}

	public function deconnexion(){
		$this-> vueadmin -> affichageCo();
		$this -> modeleadmin -> deco();
	}

	public function affichage(){
		$this-> vueadmin->affichage();
	}
}

?>