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
				}
	
				
			}
		}
	}
	public function deco(){
		unset($_SESSION['id']);
		session_destroy();
	}
	public function inscription(){
		if(!isset($_POST['login']) || trim($_POST['login']) =="" || !isset($_POST['mdp1']) || trim($_POST['mdp1'])==""){
				echo "erreur <br/>";
		}
		else{
			if ($_POST['mdp1']!==$_POST['mdp2']){
				echo "Mots de passes différents";
			}
			else{
				$newlogin= htmlspecialchars($_POST['login']);
				$newpseudo = htmlspecialchars($_POST['pseudo']);
				$newmdp = htmlspecialchars($_POST['mdp1']);

				echo "login : $newlogin" . "<br/>";
				echo "pseudo : $newpseudo" . "<br/>";
				echo "mot de passe : $newmdp" . "<br/>";

				//$sql = "insert into joueurs(idJ, loginJ, passwordJ, pseudoJ, argentJ, idN, xpJ) values(default, :login , :mdp, :pseudo, 0, 1, 0)";

				$req = self::$bdd -> prepare('INSERT INTO joueurs(loginJ, passwordJ, pseudoJ, argentJ, xpJ, idN,idP, estAdmin) values(:login , :mdp, :pseudo, 0, 0, 1,NULL ,false)');
				
				$req -> bindParam(':login', $newlogin);
				$req -> bindParam(':pseudo', $newpseudo);
				$req -> bindParam(':mdp', $newmdp);

				if($req -> execute()){
					//echo($req);
					$req -> fetch();
				}
				header('Location: index.php?module=joueur&action=menu');
				exit();


			}
			
		}

	}

}