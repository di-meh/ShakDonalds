<?php
require_once'index.php';
require_once'cont_commande.php';
require_once 'mod_generique.php';

class ModCommande extends ModGenerique{


	public function __construct(){
		$this->contr = new ContCommande();
	}

}

?>