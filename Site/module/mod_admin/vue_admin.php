<?php

class VueAdmin extends Connexion{
	public function affichage() {

		echo "<ul>
					<li><a href ='index.php?module=admin&action=ajoutingredient'>Insérer ingrédient</a></li>
					<li><a href ='index.php?module=admin&action=ajoutmachine'>Insérer machine</a></li>
					<li><a href ='index.php?module=admin&action=suppringredient'>Supprimer ingrédient</a></li>
					<li><a href ='index.php?module=admin&action=supprmachine'>Supprimer machine</a></li>
			</ul>

			";

	}

	public function affichageCo() {
		if(isset($_SESSION['idJ'])){
			include("decoadmin.html");
		}
		include("connexionadmin.html");
		

	}

	public function formajouti(){
		include'formajouti.html';
	}

	public function formajoutm(){
		include 'formajoutm.html';
	}

	public function suppri(){
		$sql = 'select * from ingredients';
		$req = self::$bdd -> prepare($sql);
		$req -> execute();
		$res = $req -> fetchAll();
		foreach ($res as $value){
    		echo $value[0] . " " . $value[1] . "<br/>";
		}
		include 'formsuppri.html';
	}

	public function supprm(){
		$sql = 'select * from machines';
		$req = self::$bdd -> prepare($sql);
		$req -> execute();
		$res = $req -> fetchAll();
		foreach ($res as $value) {
			echo $value[0] . " " .$value[1] . "<br/>";
		}
		include'formsupprm.html';
	}

	public function affichageMenu(){
		include("decoadmin.html");
		include('menu.php');
	}

}

?>