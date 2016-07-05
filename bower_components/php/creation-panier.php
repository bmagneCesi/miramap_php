<?php
include 'serv.php';
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$libelle = addslashes($request->libelle);
$prix_total = $request->prix_total;
$producteur = $request->producteur;
$produits = json_decode(json_encode($request->produits),true);

if (isset ( $libelle ) && isset ( $prix_total ) && isset ( $producteur ) && isset ( $produits ) ) {
	try {
		
		$query = $pdo->prepare ( "SELECT COUNT(*) AS exist
				FROM Panier
				WHERE libelle = '" . $libelle . "'" );
		$query->execute ();
		$panierExist = $query->fetch ();
		if ($panierExist ['exist'] == 0) {
			$query = $pdo->prepare ( "INSERT INTO Panier(libelle,prix,id_producteur) 
					VALUES('" . $libelle . "', " . $prix_total . ", " . $producteur . " )" );
			$query->execute ();

			foreach ($produits as $key => $value) {

				$query = $pdo->prepare ( "INSERT INTO contenir__PanierProduit_(quantite,id_panier,id_produit) VALUES('" . $value['quantite'] . "', (SELECT id_panier FROM Panier WHERE libelle = '" . $libelle . "') ,(SELECT id_produit FROM Produit WHERE libelle = '" . $value['libelle'] . "') )" );
				$query->execute ();	
				
			}

		}else{
			echo "error : duplicate libelle";
		}
		

		$query = $pdo->prepare ( "SELECT * 
				FROM Panier
				WHERE libelle = '" . $libelle . "'" );
		$query->execute ();
		echo json_encode ( $query-> fetchAll(PDO::FETCH_ASSOC) );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>