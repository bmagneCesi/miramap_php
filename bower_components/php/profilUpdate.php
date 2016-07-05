<?php
include ('serv.php');
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$id_utilisateur = $request->id_utilisateur;
$mail = $request->mail;
$nom = $request->nom;
$prenom = $request->prenom;
$telephone = $request->telephone;
$adresse = $request->adresse;
$date_naissance = $request->date_naissance;
$ville = $request->ville;

	if (isset($mail) && isset($nom) && isset($prenom) && isset($telephone) && isset($date_naissance) && isset($code_postal) && isset($ville) && isset($adresse)) {
		print_r('sdsd');

		try {

			$queryUser = $pdo->prepare ( "UPDATE Utilisateur SET nom='".$nom."', prenom='".$prenom."', mail='".$mail."', date_naissance='".$date_naissance."', telephone='".$telephone." WHERE id_utilisateur = ".$id_utilisateur."");
				
			$queryUser->execute();
			$queryAdresse = $pdo->prepare ( "UPDATE Adresse SET adresse = '".$adresse."', id_ville = (SELECT id_ville FROM Ville WHERE libelle LIKE '" .$ville. "'') ");

			$queryRes = $pdo->prepare ( "SELECT u.id_utilisateur, u.nom, u.prenom, u.date_naissance, u.mail, u.civilite, u.telephone, a.adresse, v.libelle ville, v.code_postal code_postal, r.libelle region
													FROM Utilisateur u
													LEFT JOIN Adresse a
													ON u.id_adresse = a.id_adresse
													LEFT JOIN Ville v
													ON a.id_ville = v.id_ville
													LEFT JOIN Region r
													ON v.id_region = r.id_region
													WHERE u.id_utilisateur = " . $id_utilisateur . "" );
						
				$queryRes->execute();
				$user_infos = $queryRes->fetch(PDO::FETCH_ASSOC);
				echo json_encode($user_infos);

		} catch ( PDOException $e ) {
			print "Erreur !: " . $e->getMessage () . "<br/>";
			die ();
		}

}
?>