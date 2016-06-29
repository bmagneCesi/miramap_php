<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$id_producteur = $request->id_producteur;

try {
	
	$paniers = $pdo->query ( "SELECT id_panier, libelle, prix FROM Panier WHERE id_producteur = ".$id_producteur );
		
	while ( list ( $id_panier, $libelle, $prix ) = $paniers->fetch ( PDO::FETCH_NUM ) ) {
		
		
		$produit = $pdo->prepare ( "SELECT p.libelle, c.quantite
				FROM Produit AS p, contenir__PanierProduit_ AS c 
				WHERE p.id_produit = c.id_produit 
					AND c.id_panier = ".$id_panier." " );		
		$produit->execute ();
		
		
		echo json_encode ( array("libelle"=>$libelle,"prix"=>$prix,"produits"=>$produit->fetchAll(PDO::FETCH_ASSOC)) );
	}
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>