<?php
include 'serv.php';
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$libelle = $request->libelle;


if (isset ( $libelle )) {
	try {
		$query = $pdo->prepare ( "SELECT COUNT(*) AS exist
				FROM Panier
				WHERE libelle = '" . $libelle . "'" );
		$query->execute ();
		$panierExist = $query->fetch ();
		if ($panierExist ['exist'] == 0) {
			$query = $pdo->prepare ( "INSERT INTO Panier(libelle,prix) 
					VALUES('" . $libelle . "',0)" );
			$query->execute ();
		}
		$query = $pdo->prepare ( "SELECT * 
				FROM Panier
				WHERE libelle = '" . $libelle . "'" );
		$query->execute ();
		echo json_encode ( $query-> fetch(PDO::FETCH_ASSOC) );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>