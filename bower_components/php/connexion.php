<?php 

	include('serv.php');
	$pdo = connectPDOMysql();

	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	
	$email = $request->mail;
	$password = $request->password;

	if (isset($email) &&
		isset($password)) {
		
			try {

				$query = $pdo->prepare(
					"SELECT * 
					FROM Utilisateur 
					WHERE mail = '".$email."' && password = '".$password."' 
					
					");
				$query->execute();
				echo json_encode($query->fetchAll());

			} catch (PDOException $e) {
			    print "Erreur !: " . $e->getMessage() . "<br/>";
			    die();
			}


	}
 ?>
