<?php session_start(); 
	require_once'module/mod_admin/mod_admin.php';
	require_once'module/mod_joueur/mod_joueur.php';
	require_once'module/mod_commande/mod_commande.php';
	require_once"connexion.php";
	
	Connexion::initConnexion();

	if(isset($_GET['module'])) {
		$module = $_GET['module'];
	} else {
		$module = 'bienvenue';
	}

	switch($module){
		case 'bienvenue':
			include('bienvenue.html');
			$vue = null;
		break;
		case 'joueur':
		case 'admin':
		case 'commande':
			$module = "mod$module";
			$mod = new $module();
			$vue = $mod -> getAffichage();
		break;
		default:
			break;
	}
	
?>
<!DOCTYPE html>
<html xml:lang="fr" lang="fr">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="style.css" />
	<title>WacDonalds</title>
</head>
<body>	
	<section>

<?php echo $vue;
var_dump($vue);
?>	



</section>
</body>
</html>



