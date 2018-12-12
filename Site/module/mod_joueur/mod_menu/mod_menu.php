<?php
require_once'index.php';
require_once'cont_menu.php';

class ModMenu{
	private $cont;

	public function __construct(){
		$this->cont = new ContMenu();
	}
	

}