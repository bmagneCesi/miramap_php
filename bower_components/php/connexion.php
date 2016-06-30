<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$user = json_decode (file_get_contents ( "php://input" ));

if (isset ( $user->email ) && isset ( $user->password )) {

	try {
		
		$query = $pdo->prepare ( "SELECT u.nom AS nom, u.prenom AS prenom, u.mail AS mail, u.telephone AS telephone, u.nationalite AS nationalite, a.adresse AS adresse, v.libelle AS ville, v.code_postal AS code_postal, r.libelle AS region, t.libelle AS role
					FROM Utilisateur AS u, Type_utilisateur AS t, Adresse AS a, Ville AS v, Region AS r
					WHERE u.mail = '" . $user->email . "' && u.password = '" . $user->password . "' && u.id_adresse = a.id_adresse && a.id_ville = v.id_ville && v.id_region = r.id_region && u.id_type_utilisateur = t.id_type_utilisateur" );
		
		$query->execute ();
		
		$res = $query->fetch(PDO::FETCH_ASSOC);

		if ($res) {
			$res['msg'] = "success";
			echo json_encode($res);
		}else{
			$res['msg'] = "Erreur d'authentification";
			echo json_encode($res);
		}
		
//		echo json_encode ( $query-> fetch(PDO::FETCH_ASSOC) );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}
?>
