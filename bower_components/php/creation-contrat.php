<?php
include 'serv.php';
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$id_utilisateur = $request->id_utilisateur;
$id_panier = $request->id_panier;
$livraison = $request->livraison;


if (isset ( $id_utilisateur ) && isset ( $id_panier ) && isset ( $livraison ) ) {
	try {

		$query = $pdo->prepare ( "INSERT INTO Contrat(id_contrat,id_livraison,etat,date_livraison, id_panier, id_producteur,id_consommateur)
				VALUES('', " . $livraison . ", 'EN COURS', '', " . $id_panier . ", (SELECT id_producteur FROM Panier WHERE id_panier = ".$id_panier."), ".$id_utilisateur." ) " );
		$query->execute ();

	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>