<?php
include 'serv.php';
$pdo = connectPDOMysql ();

$postdata = file_get_contents ( "php://input" );
$request = json_decode ( $postdata );

$libelle = $request->libelle;
$contenu = $request->contenu;
$date_de_debut = $request->date_de_debut;
$date_de_fin = $request->date_de_fin;
$prix = $request->prix;
$mail_producteur = $request->mail_producteur;

if (isset ( $contenu ) && isset ( $date_de_debut ) && isset ( $date_de_fin ) && isset ( $prix ) && isset ( $signature )) {
	try {
		$query = $pdo->prepare ( "INSERT INTO Contrat(libelle,contenu,debut,fin,prix,id_producteur)
				VALUES('" . $libelle . "','" . $contenu . "'," . $date_de_debut . "," . $date_de_fin . "," . $prix . ",(SELECT id_utilisateur FROM Utilisateur WHERE mail = '" . $mail_producteur . "')" );
		$query->execute ();
		
		$query = $pdo->prepare ( "SELECT *
				FROM Contrat
				WHERE libelle = '" . $libelle . "'
					AND contenu ='" . $contenu . "'
					AND debut ='" . $date_de_debut . "'
					AND fin = '" . $date_de_fin . "'
					AND prix = '" . $prix . "'
					AND id_producteur = (SELECT id_utilisateur FROM Utilisateur WHERE mail = '" . $mail_producteur . "')");
		$query->execute ();
		echo json_encode ( $query-> fetch(PDO::FETCH_ASSOC) );
	} catch ( PDOException $e ) {
		print "Erreur !: " . $e->getMessage () . "<br/>";
		die ();
	}
}

?>