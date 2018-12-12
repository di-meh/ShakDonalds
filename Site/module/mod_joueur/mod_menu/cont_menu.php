<?php
require_once'vue_menu.php';
require_once'modele_menu.php';

class ContMenu{
	private $vuemenu;
	private $modelemenu;


	public function __construct(){
		$this->vuemenu = new VueMenu();
		$this->modelemenu= new ModeleMenu();
		$this-> statistiques();
		
	}

	public function statistiques(){
		

		$newNom= $this-> modelemenu -> stats();
		$this-> vuemenu->affichageStats($newNom);

	}
}