<?php
require_once 'vue_generique.php';

class VueJoueur extends VueGenerique{

	public function __construct () {
		
	}
	
	public function affichageCo() {
		if(isset($_SESSION['idJ'])){
			include("deco.html");
		}
		include("connexion.html");
		

	}

	public function affichageForm(){
		include('creaCompte.html');
	
	}

	public function affichageMenu(){
		include("deco.html");
		
		include('menu.php');
	
	}

	public function affichageBoutique(){
		include('boutique.html');
	}

}