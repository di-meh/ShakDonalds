<?php
require_once'connexion.php';
class ModeleAdmin extends Connexion{
	public function __construct(){

	}

	public function testco(){
		if(isset($_SESSION['idJ'])){
			echo ' Vous etes deja co : ' . $_SESSION['idJ'] . '<br/>';
		}
		else{
			if(!isset($_POST['login']) || trim($_POST['login']) =="" || !isset($_POST['mdp']) || trim($_POST['mdp'])==""){
				echo "erreur <br/>";
			}
			else{
				$newlogin = htmlspecialchars($_POST['login']);
				$newmdp = htmlspecialchars($_POST['mdp']);

				echo "login : $newlogin" . "<br/>";
				echo "mot de passe : $newmdp" . "<br/>";

				
				$sql = 'select idJ from joueurs where loginJ like (:login) and passwordJ like (:mdp) and estAdmin=true';
				
				$req = self::$bdd -> prepare($sql);
				$req -> bindParam(':login', $newlogin);
				$req -> bindParam(':mdp', $newmdp);
 
				if($req -> execute()){


					$res = $req -> fetch();

					//echo "res : ".$res[0];
					$_SESSION['idJ'] = $res[0];
					
				}
				
			}
		}
	}
	public function deco(){
		unset($_SESSION['id']);
		session_destroy();
	}

	public function ajouti(){
		if(!isset($_POST['nom']) || !isset($_POST['prix']) || !isset($_POST['desc']) || !isset($_POST['niveau']) || !isset($_POST['categorie'])) {
		}
		else {
			$nom= htmlspecialchars($_POST['nom']);
			$prix= htmlspecialchars($_POST['prix']);
			$desc= htmlspecialchars($_POST['desc']);
			$niv= htmlspecialchars($_POST['niveau']);
			$cat= htmlspecialchars($_POST['categorie']);

			$sql = 'insert into ingredients values (default, :nom, :prix, :desc, :niv, :cat)';
			$req = self::$bdd -> prepare($sql);
			$req -> bindparam(':nom', $nom);
			$req -> bindparam(':prix', $prix);
			$req -> bindparam(':desc', $desc);
			$req -> bindparam(':niv', $niv);
			$req -> bindparam(':cat', $cat);

			if($req -> execute()){
				echo "insertion réussie";
			}
		}
	}

	public function ajoutm(){
		if(!isset($_POST['nom']) || !isset($_POST['prix']) || !isset($_POST['desc']) || !isset($_POST['niveau']) || !isset($_POST['entretien'])) {
		}
		else {
			$nom= htmlspecialchars($_POST['nom']);
			$prix= htmlspecialchars($_POST['prix']);
			$desc= htmlspecialchars($_POST['desc']);
			$niv= htmlspecialchars($_POST['niveau']);
			$ent= htmlspecialchars($_POST['entretien']);

			$sql = 'insert into machines values (default, :nom, :prix, :ent, :desc, :niv)';
			$req = self::$bdd -> prepare($sql);
			$req -> bindparam(':nom', $nom);
			$req -> bindparam(':prix', $prix);
			$req -> bindparam(':desc', $desc);
			$req -> bindparam(':niv', $niv);
			$req -> bindparam(':ent', $ent);

			if($req -> execute()){
				echo "insertion réussie";
			}
		}
	}

	public function suppri(){
		if(isset($_POST['id'])){
			$id = htmlspecialchars($_POST['id']);
			$sql = 'delete from ingredients where idI = :id';
			$req = self::$bdd -> prepare($sql);
			$req -> bindParam(':id', $id);
			if($req -> execute()){
				echo "suppression réussie";
			}
		}
		$sql = 'select * from ingredients';
		$req = self::$bdd -> prepare($sql);
		$req -> execute();
		$res = $req -> fetchAll();
		foreach ($res as $value){
    		echo $value[0] . " " . $value[1] . "<br/>";
		}
	}

	public function supprm(){
		if(isset($_POST['id'])){
			$id = htmlspecialchars($_POST['id']);
			$sql = 'delete from machines where idM = :id';
			$req = self::$bdd -> prepare($sql);
			$req -> bindParam(':id', $id);
			if($req -> execute()){
				echo "suppression réussie";
			}
		}
		$sql = 'select * from machines';
		$req = self::$bdd -> prepare($sql);
		$req -> execute();
		$res = $req -> fetchAll();
		foreach ($res as $value) {
			echo $value[0] . " " .$value[1] . "<br/>";
		}
	}

}

?>