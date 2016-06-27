<?php
include ('serv.php');
$pdo = connectPDOMysql ();

try {
	$query = $pdo->prepare ( "SELECT * FROM Contrat WHERE signature = 1" );
	$query->execute ();
	echo json_encode ( $query->fetchAll () );
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}

?>