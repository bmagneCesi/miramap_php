<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$id_producteur = $request->id_producteur;

try {
	
	$q = $pdo->prepare( "SELECT id_panier, libelle, prix prix_total FROM Panier WHERE id_producteur = ".$id_producteur );
	$q->execute();
	$paniers = $q->fetchAll( PDO::FETCH_ASSOC );	

	foreach ($paniers as $key => &$value) {
		$query = $pdo->prepare( "SELECT id_produit, quantite FROM contenir__PanierProduit_ WHERE id_panier = ".$value['id_panier'] );
		$query->execute();
		$produits = $query->fetchAll( PDO::FETCH_ASSOC );

		foreach ($produits as $k => $v) {

			$r = $pdo->prepare( "SELECT libelle, prix_unitaire FROM Produit WHERE id_produit = ".$v['id_produit'] );
			$r->execute();
			$produit = $r->fetchAll( PDO::FETCH_ASSOC );
			foreach ($produit as $cle => $val) {
				$val['quantite'] = $v['quantite'];
				$value['produits'][] = $val; 
			}

		}


	}
	
	echo json_encode ( $paniers);

} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>