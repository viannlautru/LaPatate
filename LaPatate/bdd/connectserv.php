<?php
require("connect.php");
function connect_bd(){
$dsn="mysql:dbname=".BASE.";host=".SERVER.";charset=utf8";
try{
$connexion=new PDO($dsn,USER,PASSWD);
}
catch(PDOException $e){
printf("Échec de la connexion : %s\n", $e->getMessage());
exit();
}
return $connexion;
}
?>
