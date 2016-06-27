<?php
include 'serv.php';
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$libelle = $request->libelle;
$prix_unitaire = $request->prix_unitaire;
$quantite = $request->quantite;
$producteur = $request->producteur;

if (isset ( $libelle ) && isset ( $prix_unitaire ) && isset ( $quantite ) && isset ( $producteur )) {
	try {
		$query = $pdo->prepare ( "SELECT COUNT(*) AS exist
				FROM Produit 
				WHERE libelle = '" . $libelle . "' 
					AND prix_unitaire = " . $prix_unitaire . " 
					AND id_consommateur = (SELECT id_utilisateur 
						FROM Utilisateur 
						WHERE mail = '" . $producteur . "')" );
		$query->execute ();
		$produitExist = $query->fetch ();
		if ($produitExist ['exist'] == 0) {
			$query = $pdo->prepare ( "INSERT INTO Produit(libelle,prix_unitaire,quantite,id_consommateur)
				VALUES ('" . $libelle . "', " . $prix_unitaire . ", " . $quantite . ",(SELECT id_utilisateur FROM Utilisateur WHERE mail = '" . $producteur . "')" );
			$query->execute ();
		} else {
			$query = $pdo->prepare ( "UPDATE Produit 
					SET quantite = quantite + " . $quantite . "
					WHERE libelle = '" . $libelle . "' 
						AND prix_unitaire = " . $prix_unitaire . " 
						AND id_consommateur = (SELECT id_utilisateur 
							FROM Utilisateur 
							WHERE mail = '" . $producteur . "')" );
			$query->execute ();
		}
		$query = $pdo->prepare ( "SELECT * 
				FROM Produit
				WHERE libelle = '" . $libelle . "' 
					AND prix_unitaire = " . $prix_unitaire . " 
					AND id_consommateur = (SELECT id_utilisateur FROM Utilisateur WHERE mail = '" . $producteur . "')");
		
		$query->execute ();
		echo json_encode ( $query-> fetch(PDO::FETCH_ASSOC) );
		
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}
?>