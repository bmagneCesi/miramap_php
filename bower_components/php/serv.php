<?php
function connectPDOMysql()
{

	$dsn = 'mysql:dbname=miramap_test;host=localhost';
	$user = 'root';
	$password = 'root';

	try {
		
	    $pdo = new PDO($dsn, $user, $password);
	    return $pdo;

	} catch (PDOException $e) {
	    echo 'Connexion échouée : ' . $e->getMessage();
	}
         
}