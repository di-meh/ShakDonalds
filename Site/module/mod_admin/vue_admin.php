<?php

class VueAdmin{
	public function affichage() {

		echo "<ul>
					<li><a href ='index.php?module=admin&action=ajout'>Insérer</a></li>
					<li><a href ='index.php?module=admin&action=suppr'>Supprimer</a></li>
			</ul>

			";

	}

}