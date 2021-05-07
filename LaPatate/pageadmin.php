<?php
	require_once('bdd/connectserv.php');
   $db=connect_bd();
   ?>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/Style.css" rel="stylesheet">
<script src="script/script.js"></script>
</head>
<body >
<?php require "src/nav.php"; ?>
<div class="main">
<header >
<?php if (!isset($_SESSION['ADMIN'])){ header('Location: index.php'); } 
require_once('bdd/connectserv.php');
$db=connect_bd();
function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}
spl_autoload_register('chargerClasse');

?>
<section class="sousmenu">
  <h1>Espace administrateur</h1>
  <a class='petitbloc petitblocv' onclick="javascript:afficher_cacher('ajout');"style="cursor:pointer;">Ajouter de nouvelles patates</a>
  <a class='petitbloc petitblocr' onclick="javascript:afficher_cacher('stock');"style="cursor:pointer;">Refaire du stock</a>
  <a class='petitbloc petitblocg' onclick="javascript:afficher_cacher('commande');"style="cursor:pointer;">Gérer les commandes</a>
  <a class='petitbloc petitblocb' onclick="javascript:afficher_cacher('recette');"style="cursor:pointer;">Gérer les recettes</a>
</section>
</header>
<section class="activiter">
<?php
include 'src/ajout.php';
include 'src/commande.php';
include 'src/stock.php';
include 'src/recettepropo.php';

?>

</section>
    <script type="text/javascript">
    //<!--
    afficher_cacher('ajout');
        afficher_cacher('commande');
        afficher_cacher('stock');
        afficher_cacher('recette');
      var c_valeur = document.cookie;
      //L'affichage des differentes page appelé
      if(c_valeur.lastIndexOf('ajout')== 11){
        afficher_cacher('ajout');
      }
      if(c_valeur.lastIndexOf('stock')== 11){
        afficher_cacher('stock');
      }
      if(c_valeur.lastIndexOf('commande')== 11){
        afficher_cacher('commande');
      }
      if(c_valeur.lastIndexOf('recette')== 11){
        afficher_cacher('recette');
      }
       
        
    //-->
    </script>
</div>
<?php require "src/footer.php"; ?>
</body>
</html>
