<?php

class VueJoueur{
	public function affichageCo() {
		if(isset($_SESSION['idJ'])){
			include("deco.html");
		}
		include("connexion.html");
		

	}

	public function affichageNouv(){

	}

	public function affichageMenu(){
		include("deco.html");
		include('menu.php');
	}

}