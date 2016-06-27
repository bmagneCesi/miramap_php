<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$panier = $request->panier;

if (isset ( $panier ) && isset ( $consomateur )) {
	try {
		$query = $pdo->prepare ( "UPDATE Panier SET archive = 0 WHERE libelle = '" . $panier . "'" );
		$query->execute ();
		$query = $pdo->prepare ( "SELECT * FROM Panier WHERE WHERE libelle = '" . $panier . "'" );
		$query->execute ();
		echo json_encode ( $query->fetchAll () );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>