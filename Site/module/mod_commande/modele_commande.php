<?php
require_once'connexion.php';
class ModeleCommande extends Connexion{
	public function __construct(){

	}

	
	public function random(){
		$sql1 = 'select distinct idI, nomI from ingredients where idC=1 order by rand() limit 1';
		$req1 = self::$bdd->prepare($sql1);
		$req1 -> execute();
		$res1 = $req1 -> fetchAll();
		echo "ingrédient 1 : " . $res1[0]['idI']. " ". $res1[0]['nomI'] . "<br>";
		$sql2 = 'select distinct idI, nomI from ingredients where idC=2 order by rand() limit 1';
		$req2 = self::$bdd->prepare($sql2);
		$req2 -> execute();
		$res2 = $req2 -> fetchAll();
		echo "ingrédient 2 : " . $res2[0]['idI']. " ". $res2[0]['nomI'] . "<br>";
		$sql3 = 'select distinct idI, nomI from ingredients where idC=3 order by rand() limit 1';
		$req3 = self::$bdd->prepare($sql3);
		$req3 -> execute();
		$res3 = $req3 -> fetchAll();
		echo "ingrédient 3 : " . $res3[0]['idI']. " ". $res3[0]['nomI'] . "<br>";
		$sql4 = 'select distinct idI, nomI from ingredients where idC=6 order by rand() limit 1';
		$req4 = self::$bdd->prepare($sql4);
		$req4 -> execute();
		$res4 = $req4 -> fetchAll();
		echo "ingrédient 4 : " . $res4[0]['idI']. " ". $res4[0]['nomI'] . "<br>";
		$sql5 = 'select distinct idI, nomI from ingredients where idC=7 order by rand() limit 1';
		$req5 = self::$bdd->prepare($sql5);
		$req5 -> execute();
		$res5 = $req5 -> fetchAll();
		echo "ingrédient 5 : " . $res5[0]['idI']. " ". $res5[0]['nomI'] . "<br>";
		$sql6 = 'select distinct idI, nomI from ingredients where idC=8 order by rand() limit 1';
		$req6 = self::$bdd->prepare($sql6);
		$req6 -> execute();
		$res6 = $req6 -> fetchAll();
		echo "ingrédient 6 : " . $res6[0]['idI']. " ". $res6[0]['nomI'] . "<br>";
		$sql7 = 'select distinct idI, nomI from ingredients where idC=5 order by rand() limit 1';
		$req7 = self::$bdd->prepare($sql7);
		$req7 -> execute();
		$res7 = $req7 -> fetchAll();
		echo "ingrédient 7 : " . $res7[0]['idI']. " ". $res7[0]['nomI'] . "<br>";
	}

}

?>