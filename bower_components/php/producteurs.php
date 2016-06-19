<?php
include ('serv.php');
$pdo = connectPDOMysql ();

try {
	
	$query = $pdo->prepare ( "SELECT u.nom AS nom, u.prenom AS prenom, u.mail AS mail, u.telephone AS telephone, u.nationalite AS nationalite, a.adresse AS adresse, v.libelle AS ville, v.code_postal AS code_postal, r.libelle AS region 
			FROM Utilisateur AS u, Ville AS v, Region AS r, Type_utilisateur AS t
			WHERE a.id_ville = v.id_ville 
				AND v.id_region = r.id_region 
				AND u.id_type_utilisateur = t.id_type_utilisateur
				AND t.libelle = 'producteur'" );
	
	$query->execute ();
	echo json_encode ( $query->fetchAll () );
} catch ( PDOException $e ) {
	print "Erreur !: " . $e->getMessage () . "<br/>";
	die ();
}
?>