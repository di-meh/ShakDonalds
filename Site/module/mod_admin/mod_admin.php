<?php
require_once'index.php';
require_once'module/mod_admin/cont_admin.php';

class ModAdmin{
	private $cont;

	public function __construct(){
		$this->cont = new ContAdmin();
	}
	
	public function affichage(){
		return $this->cont->affichage();
	}

}