<?php
include ('serv.php');
$pdo = connectPDOMysql ();

try {
	
	$paniers = $pdo->query ( "SELECT id_panier, libelle, prix FROM Panier" );
	
	while ( list ( $id_panier, $libelle, $prix ) = $paniers->fetch ( PDO::FETCH_NUM ) ) {
		
		
		$produit = $pdo->prepare ( "SELECT p.libelle 
				FROM Produit AS p, contenir__PanierProduit_ AS c 
				WHERE p.id_produit = c.id_produit 
					AND c.id_panier = ".$id_panier." " );		
		$produit->execute ();
		
		
		echo json_encode ( array("libelle"=>$libelle,"prix"=>$prix,"produits"=>json_encode($produit-> fetchAll())) );
	}
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>