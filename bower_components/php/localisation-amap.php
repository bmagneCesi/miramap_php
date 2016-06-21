<?php
include ('serv.php');
$pdo = connectPDOMysql ();

try {
	
	$query = $pdo->prepare ( "SELECT a.libelle, a.adresse, v.ville, v.code_postal, r.region 
			FROM AMAP AS a, Ville AS v, Region AS r
			WHERE a.id_ville = v.id_ville AND v.id_region = r.id_region" );
	
	$query->execute ();
	echo json_encode ( $query->fetchAll () );
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>
