<?php
require_once'index.php';
require_once'module/mod_admin/cont_admin.php';
require_once 'mod_generique.php';

class ModAdmin extends ModGenerique{

	public function __construct(){
		$this->contr = new ContAdmin();
	}
	
	

}

?>