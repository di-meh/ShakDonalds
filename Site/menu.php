<!DOCTYPE html>
<html xml:lang="fr" lang="fr">
<head>
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet"> 
	<meta charset = "UTF-8"/>
	<title> Шакдоналдс</title>
	<LINK href="style.css" rel="stylesheet" type="text/css"> 


	
</head>
<body>
	<header>
		<a href="index.php"><img src = "mw.png" alt = "logo" id="logo"/></a>
		<h1>Шакдоналдс</h1>
	</header>
	<SECTION id="menu">
		<div id="lienBoutique">
		<a href="boutique.html">Boutique</a>

	</div>
	<div id="boutons">
		<!--<button type="button" name="reprendreP" id="reprendreP">Reprendre Partie</button>-->
		<button type="button" name="nouvelleP" id="nouvelleP" onclick="location.href='jeu1.html'">Nouvelle Partie</button>
		<button type="button" name="boutique" id="boutique">Boutique</button>

	

	<div id="divStats">
		<h1>Profil</h1>
		<img src="profil.png" id="profil">

		<div id="stats">

			<ul style="list-style-type: none;">
				<li>Nom: <?php echo $resNom ?></li>
				<li>Partie en cours : </li>
				<li>Score : </li>
			</ul>
		</div>

	</div>
	
	</SECTION>

</body>
</html>