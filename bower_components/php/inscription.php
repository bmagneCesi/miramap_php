<?php 

	include 'serv.php';
	$pdo = connectPDOMysql();
	
	$email = $_POST['email'];
	$prenom = $_POST['prenom'];
	$nom = $_POST['nom'];
	$password = $_POST['password'];
	$adresse = $_POST['adresse'];
	$date_naissance = $_POST['date_naissance'];
	$civilite = $_POST['civilite'];
	$telephone = $_POST['telephone'];
	$nationalite = $_POST['nationalite'];
	$code_postal = $_POST['code_postal'];
	$ville = $_POST['ville'];
	$region = $_POST['region'];
	$type_utilisateur = $_POST['type_utilisateur'];

	if (isset($email) &&
		isset($prenom) &&
		isset($nom) &&
		isset($password) &&
		isset($adresse) &&
		isset($date_naissance) &&
		isset($civilite) &&
		isset($telephone) &&
		isset($nationalite) &&
		isset($code_postal) &&
		isset($ville) &&
		isset($region) &&
		isset($type_utilisateur)) {
		
			try {

			$res = $pdo->query("INSERT INTO "); 
		    
		    echo json_encode($res->fetchAll()); // retourner le résultat de la requete en json

			} catch (PDOException $e) {
			    print "Erreur !: " . $e->getMessage() . "<br/>";
			    die();
			}


	}

 ?>