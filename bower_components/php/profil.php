<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$id_utilisateur = $request->id_utilisateur;
$role = $request->role;

if (isset($id_utilisateur)) {

		try {
			
			$query = $pdo->prepare ( "SELECT u.id_utilisateur, u.nom, u.prenom, u.date_naissance, u.mail, u.civilite, u.telephone, a.adresse, v.libelle ville, v.code_postal code_postal, r.libelle region
										FROM Utilisateur u
										LEFT JOIN Adresse a
										ON u.id_adresse = a.id_adresse
										LEFT JOIN Ville v
										ON a.id_ville = v.id_ville
										LEFT JOIN Region r
										ON v.id_region = r.id_region
										WHERE u.id_utilisateur = " . $id_utilisateur . "" );
			
			$query->execute();

			$user_infos = $query->fetch(PDO::FETCH_ASSOC);

			if (isset($id_utilisateur) && $role == "Consommateur") {
			
				$q = $pdo->prepare ( "SELECT c.etat, c.date_livraison, c.id_panier, c.id_producteur, p.libelle, p.prix, l.libelle livraison FROM Contrat c, Panier p, Type_livraison l WHERE c.id_consommateur = ".$id_utilisateur." AND p.id_panier = c.id_panier AND c.id_livraison = l.id_type_livraison" );
				$q->execute();
				$user_contrats = $q->fetchAll( PDO::FETCH_ASSOC );

			}else if (isset($id_utilisateur) && $role == "Producteur") {
				
				$q = $pdo->prepare ( "SELECT c.etat, c.date_livraison, c.id_panier, c.id_producteur, p.libelle, p.prix, l.libelle livraison, u.nom, u.prenom FROM Contrat c, Panier p, Type_livraison l, Utilisateur U WHERE c.id_producteur = ".$id_utilisateur." AND p.id_panier = c.id_panier AND c.id_livraison = l.id_type_livraison AND u.id_utilisateur = c.id_consommateur" );
				$q->execute();
				$user_contrats = $q->fetchAll( PDO::FETCH_ASSOC );

			}

			$res['utilisateur'] = $user_infos;
			$res['contrats'] = $user_contrats;

			echo json_encode($res);

		} catch ( PDOException $e ) {
			print "Erreur !: " . $e->getMessage () . "<br/>";
			die ();
		}

}
?>