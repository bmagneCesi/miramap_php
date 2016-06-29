<?php
include ('serv.php');
$pdo = connectPDOMysql ();

try {
	
	$query = $pdo->prepare ( "SELECT u.id_utilisateur, u.nom, u.prenom, u.date_naissance, u.mail, u.civilite, u.telephone, a.adresse, v.libelle ville, v.code_postal code_postal, r.libelle region
								FROM Utilisateur u
								LEFT JOIN Adresse a
								ON u.id_adresse = a.id_adresse
								LEFT JOIN Ville v
								ON a.id_ville = v.id_ville
								LEFT JOIN Region r
								ON v.id_region = r.id_region
								LEFT JOIN Type_utilisateur tu
								ON u.id_type_utilisateur = tu.id_type_utilisateur
								WHERE tu.id_type_utilisateur = 1" );
	
	$query->execute ();
	
		while($r = $query->fetch ( PDO::FETCH_ASSOC )){
	    $rows[] = $r; 
	}
	echo json_encode ( $rows );
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>