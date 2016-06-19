<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$email = $request->email;
$password = $request->password;

if (isset ( $email ) && isset ( $password )) {
	
	try {
		
		$query = $pdo->prepare ( "SELECT u.nom AS nom, u.prenom AS prenom, u.mail AS mail, u.telephone AS telephone, u.nationalite AS nationalite, a.adresse AS adresse, v.libelle AS ville, v.code_postal AS code_postal, r.libelle AS region, t.libelle AS role
					FROM Utilisateur AS u, Type_utilisateur AS t, Adresse AS a, Ville AS v, Region AS r
					WHERE u.mail = '" . $email . "' && u.password = '" . $password . "' && u.id_adresse = a.id_adresse && a.id_ville = v.id_ville && v.id_region = r.id_region && u.id_type_utilisateur = t.id_type_utilisateur" );
		
		$query->execute ();
		echo json_encode ( $query-> fetch(PDO::FETCH_ASSOC) );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}
?>
