<?php
require_once'connexion.php';
class ModeleMenu extends Connexion{
	public function __construct(){

	}

	public function stats(){
		try{

		$sql = 'select pseudoJ from joueurs where idJ=:id';
		var_dump($_SESSION);
		$id=$_SESSION['idJ'];
		$req = self::$bdd ->prepare($sql);
		$req -> bindParam(':id', $id);
		if($req->execute()){
			$res=$req->fetch();
			$newNom=$res[0];
			return $newNom;
		}
		var_dump($res[0]);

	}catch(PDOException $e){
		echo "erreur";
	}
	}
}