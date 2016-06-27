<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$libelle = $request->libelle;
$mail = $request->mail;

if (isset ( $libelle ) && isset ( $mail)) {
	try {
		$query = $pdo->prepare ( "UPDATE Contrat SET signature = (SELECT id_utilisateur FROM Utilisateur WHERE mail = '".$mail."') WHERE libelle = '" . $libelle . "'" );
		$query->execute ();
		$query = $pdo->prepare ( "SELECT * FROM Panier WHERE libelle = '" . $libelle . "'" );
		$query->execute ();
		echo json_encode ( $query->fetchAll () );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>