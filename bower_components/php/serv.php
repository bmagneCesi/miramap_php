<?php
function connectPDOMysql()
{

	$dsn = 'mysql:dbname=miramap;host=localhost';
	$user = 'root';
	$password = 'ggagni42';

	try {
		
	    $pdo = new PDO($dsn, $user, $password);
	    return $pdo;

	} catch (PDOException $e) {
	    echo 'Connexion échouée : ' . $e->getMessage();
	}
         
}