<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

if (isset($request->id_panier)) {
	$id_panier = $request->id_panier;
	try {
		
		$q = $pdo->prepare( "SELECT p.id_panier, p.libelle, p.prix prix_total, u.nom, u.prenom, u.civilite FROM Panier p, Utilisateur u WHERE u.id_utilisateur = p.id_producteur AND p.id_panier = ".$id_panier);
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
		
		$res = array();
		$e = $pdo->prepare( "SELECT * FROM Type_livraison");
		$e->execute();
		$livraison = $e->fetchAll( PDO::FETCH_ASSOC );
		$res['livraison'] = $livraison;
		$res['panier'] = $paniers;
		echo json_encode ( $res);

	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}

}else{

	try {
		
		$q = $pdo->prepare( "SELECT p.id_panier, p.libelle, p.prix prix_total, u.nom, u.prenom, u.civilite FROM Panier p, Utilisateur u WHERE u.id_utilisateur = p.id_producteur");
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

		echo json_encode($paniers);

	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}
?>