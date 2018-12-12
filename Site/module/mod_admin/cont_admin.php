<?php
require_once'vue_admin.php';
require_once'modele_admin.php';

class ContAdmin{
	private $vueadmin;
	private $modeleadmin;

	public function __construct(){
		$this->vueadmin = new VueAdmin();
		$this->modeleadmin = new ModeleAdmin();
	}

	public function affichage(){
		return $this->vueadmin->affichage();
	}
}