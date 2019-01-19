<?php
require_once'connexion.php';
class ModeleCommande extends Connexion{
	public function __construct(){

	}

	
	public function random(){
		$sql = 'select distinct idI, nomI from ingredients order by rand() limit 6';
		$req = self::$bdd->prepare($sql);
		$req -> execute();
		$res = $req -> fetchAll();
		for($i=0;$i<6;$i++){
			echo "ingrédient " . $i . " : " . $res[$i]['idI']. " ". $res[$i]['nomI'] . "<br>";
		}
	}

}

?>