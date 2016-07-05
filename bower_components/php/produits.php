<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$producteur = $request->producteur;

try {
	
	$produits = $pdo->query ( "SELECT * FROM Produit WHERE id_consommateur = " .$producteur);
	$produits->execute ();
	echo json_encode ( $produits-> fetchAll(PDO::FETCH_ASSOC) );
	
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>