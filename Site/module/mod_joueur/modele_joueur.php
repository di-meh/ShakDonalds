<?php
require_once'connexion.php';
class ModeleJoueur extends Connexion{
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

				
				$sql = 'select idJ from joueurs where loginJ like (:login) and passwordJ like (:mdp)';
				
				$req = self::$bdd -> prepare($sql);
				$req -> bindParam(':login', $newlogin);
				$req -> bindParam(':mdp', $newmdp);
 
				if($req -> execute()){


					$res = $req -> fetch();

					//echo "res : ".$res[0];
					$_SESSION['idJ'] = $res[0];
					var_dump($res[0]);
				}
				var_dump($_SESSION);
			}
		}
	}
	public function deco(){
		unset($_SESSION['id']);
		var_dump($_SESSION);
		session_destroy();
	}

}