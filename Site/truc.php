
<html>
<body>
<?php

	session_start();

	//Test de connexion admin
	$_SESSION['login'] = htmlspecialchars($_POST['login']);
	$_SESSION['passwd'] = htmlspecialchars(md5($_POST['mdp']));

	/*
	if (isset($_SESSION['login'])) {
				echo "Vous etes déjà co";
			}
			else {
				if ( !isset($_POST['login']) || trim($_POST['login']) == "" || !isset($_POST['mdp']) || trim($_POST['mdp']) == "") {
				echo "Erreur de connexion" . "<br>";
			}
	*/

	if ($_SESSION['login'] == "admin" && $_SESSION['passwd'] == "21232f297a57a5a743894a0e4a801fc3") {
		echo "Vous etes connecté au compte Admin.";
	}



?>
</body>
</html>



