<?php
class VueMenu{
	public function affichageStats($newNom){
		?>
		<!DOCTYPE html>
		<html xml:lang="fr" lang="fr">
		<head>
	 	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	 	<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet"> 
		<meta charset = "UTF-8"/>
		<title>Шакдоналдс</title>
		<LINK href="style.css" rel="stylesheet" type="text/css"> 


	
		</head>
		<body>
		<SECTION id="menu">
		<h1>WacDonald's</h1>
		<?php
		include("deco.html");
		?>
		<div id="boutons">

		<!--<button type="button" name="reprendreP" id="reprendreP">Reprendre Partie</button>-->
		<button type="button" name="nouvelleP" id="nouvelleP">Nouvelle Partie</button>
		<form method="post" action='index.php?module=joueur&action=boutique'><input type="submit" name="boutique" value="Boutique" id="boutique"/>
		</form>
		</div>

		<div id="divStats">
		<h1>Profil</h1>
		<img src="profil.png" id="profil">

		<div id="stats">
			<ul style="list-style-type: none;">
				<li>Nom : <?php echo $newNom ?></li>
				<li>Partie en cours : </li>
				<li>Score : </li>
			</ul>
		</div>

		</div>
	
		</SECTION>

	</body>
	</html>
	<?php
	}
}
?>