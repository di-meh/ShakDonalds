<?php session_start(); ?>
<!DOCTYPE html>
<html xml:lang="fr" lang="fr">

<?php
	require_once"connexion.php";
	
	Connexion::initConnexion();

	if(!isset($_GET['module'])){
	$_GET['module']='bienvenue';
	}

	switch($_GET['module']){
	case 'admin':
		require_once'module/mod_admin/mod_admin.php';
		$module= new ModAdmin();

	break;
	case 'joueur':
		require_once'module/mod_joueur/mod_joueur.php';
		$module = new ModJoueur();
	break;
	case 'bienvenue':
		include('bienvenue.html');
	break;
	/*case 'menu':
		require_once'module/mod_menu/mod_menu.php';
		$module = new ModMenu();
	break;*/
	
	}
		//inclure page html
	

?>
<head>
</head>
<body>	
</body>
</html>



