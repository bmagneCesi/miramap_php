<?php
include 'serv.php';
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$email = $request->email;
$prenom = $request->prenom;
$nom = $request->nom;
$password = $request->password;
$adresse = $request->adresse;
$date_naissance = $request->date_naissance;
$civilite = $request->civilite;
$telephone = $request->telephone;
$nationalite = $request->nationalite;
$code_postal = $request->code_postal;
$ville = $request->ville;
$region = $request->region;
$type_utilisateur = $request->type_utilisateur;

if (isset ( $email ) && isset ( $prenom ) && isset ( $nom ) && isset ( $password ) && isset ( $adresse ) && isset ( $date_naissance ) && isset ( $civilite ) && isset ( $telephone ) && isset ( $nationalite ) && isset ( $code_postal ) && isset ( $ville ) && isset ( $region ) && isset ( $type_utilisateur )) {
	
	try {
		$query = $pdo->prepare ( "SELECT COUNT(*) AS exist 
				FROM Utilisateur 
				WHERE mail = '" . $email . "'" );
		$query->execute ();
		$utilExist = $query->fetch ();
		if ($utilExist ['exist'] == 0) {
			// insert la region si elle n'existe pas
			$query = $pdo->prepare ( "SELECT COUNT(*) AS exist 
					FROM Region 
					WHERE libelle = '" . $region . "'" );
			$query->execute ();
			$regionExist = $query->fetch ();
			if ($regionExist ['exist'] == 0) {
				$query = $pdo->prepare ( "INSERT INTO Region (libelle)
					VALUES ('" . $region . "')" );
				$query->execute ();
			}
			
			// insert la ville si elle n'existe pas
			$query = $pdo->prepare ( "SELECT COUNT(*) AS exist 
					FROM Ville 
					WHERE libelle = '" . $ville . "' 
						AND code_postal = '" . $code_postal . "' 
						AND id_region = (SELECT id_region 
							FROM Region 
							WHERE libelle = '" . $region . "' LIMIT 1)" );
			$query->execute ();
			$villeExist = $query->fetch ();
			if ($villeExist ['exist'] == 0) {
				$query = $pdo->prepare ( "INSERT INTO Ville (libelle,code_postal,id_region)
					VALUES ('" . $ville . "','" . $code_postal . "', (SELECT id_region FROM Region WHERE libelle = '" . $region . "' LIMIT 1))" );
				$query->execute ();
			}
			
			// insert l'adresse si elle n'existe pas
			$query = $pdo->prepare ( "SELECT COUNT(*) AS exist
					FROM Adresse
					WHERE adresse = '" . $adresse . "'
						AND id_ville = (SELECT id_ville 
							FROM Ville 
							WHERE libelle = '" . $ville . "' 
								AND code_postal = '" . $code_postal . "' LIMIT 1)" );
			$query->execute ();
			$adresseExist = $query->fetch ();
			if ($adresseExist ['exist'] == 0) {
				$query = $pdo->prepare ( "INSERT INTO Adresse (adresse,id_ville) 
					VALUES ('" . $adresse . "',(SELECT id_ville FROM Ville WHERE libelle = '" . $ville . "' AND code_postal = '" . $code_postal . "' LIMIT 1))" );
				$query->execute ();
			}
			
			// insert l'utilisateur
			$query = $pdo->prepare ( "INSERT INTO Utilisateur(mail,password,nom,prenom,date_naissance,civilite,telephone,nationalite,id_adresse,id_type_utilisateur)
					VALUES ('" . $email . "','" . $password . "','" . $nom . "','" . $prenom . "', '" . $date_naissance . "', '" . $civilite . "','" . $telephone . "','" . $nationalite . "',
						(SELECT a.id_adresse 
							FROM Adresse AS a, Ville AS v, Region AS r
							WHERE r.libelle = '" . $region . "' AND r.id_region = v.id_region AND v.libelle = '" . $ville . "' AND v.code_postal = '" . $code_postal . "' AND v.id_ville = a.id_ville AND a.adresse = '" . $adresse . "'),
						(SELECT id_type_utilisateur 
							FROM Type_utilisateur 
							WHERE libelle = '" . $type_utilisateur . "'))" );
			$query->execute ();
			
			// retourne l'utilisateur inscrit
			$query = $pdo->prepare ( "SELECT u.nom AS nom, u.date_naissance AS date_naissance, u.prenom AS prenom, u.mail AS mail, u.telephone AS telephone, u.nationalite AS nationalite, a.adresse AS adresse, v.libelle AS ville, v.code_postal AS code_postal, r.libelle AS region, t.libelle AS role
					FROM Utilisateur AS u, Type_utilisateur AS t, Adresse AS a, Ville AS v, Region AS r
					WHERE u.mail = '" . $email . "' && u.id_adresse = a.id_adresse && a.id_ville = v.id_ville && v.id_region = r.id_region && u.id_type_utilisateur = t.id_type_utilisateur" );
			$query->execute ();
			echo json_encode ( $query->fetch ( PDO::FETCH_ASSOC ) );


		} else {
			echo "erreur: un utilisateur utilise déjà cette email";
		}
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>