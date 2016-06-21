<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$panier = $request->panier;
$produit = $request->produit;
$quantite = $request->quantite;

if (isset ( $panier ) && isset ( $produit ) && isset ( $quantite )) {
	
	try {
		$query = $pdo->prepare ( "INSERT INTO contenir__PanierProduit_ (id_panier, id_produit, quantite)
				VALUES ((SELECT id_panier FROM Panier WHERE libelle = '" . $panier . "' LIMIT 1), (SELECT id_produit FROM Produit WHERE libelle = '" . $produit . "' LIMIT 1)), " . $quantite . "" );
		$query->execute ();
		
		$query = $pdo->prepare ( "UPDATE Produit
				SET quantite = quantite - " . $quantite . "
				WHERE libelle = '" . $panier . "'" );
		$query->execute ();
		
		$query = $pdo->prepare ( "UPDATE Panier
				SET prix = prix + " . $quantite . " * (SELECT prix_unitaire FROM Produit WHERE libelle = '" . $produit . "' LIMIT 1)" );
		$query->execute ();
		
		$query = $pdo->prepare ( "SELECT p.libelle, p.quantite FROM Produit AS p, contenir__PanierProduit_ AS c
				WHERE p.id_produit = c.id_produit AND c.id_panier = (SELECT id_panier FROM Panier WHERE libelle = '" . $panier . "' LIMIT 1)" );
		$query->execute ();
		echo json_encode ( $query->fetchAll () );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>