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
<div class="debut">
  <h1>Les recettes </h1>
  <a href="recettecreation.php" type="text">Présentez votre recette</a>
</div>
</header>
<?php

require_once('bdd/connectserv.php');
$db=connect_bd();
function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}

spl_autoload_register('chargerClasse');

$manager = new Recettemanager($db);
$listerecettes = $manager->getList();
  $recettes = "";
  // On affiche en parcourant le tableau
  foreach ($listerecettes as $recette) 
  {
    //si la recette est valider on l'affiche
    if($recette->getValidation()==1){
    $recettes .=
    '<li>
      <a href="laRecette.php?recette='.$recette->getId_recette().'">
        <div class="produitrecette">
          <div class="placementrecette">
            <div class="taillerecette">
                <img class="imageproduitrecette" src="'.$recette->getimage_recette().'"/>
            </div>
          </div>
          <div class="placementproduitrecette">
            <div class="detailproduitrecette"> 
              <div class="textproduitrecette"> 
                <h2>'.$recette->getNom_recette().'</h2>
                <p>'.$manager->getlacategorie($recette->getCategorie()).' </p>
                <p>'.$recette->getDuree().' min </p>
                <div class="traitgris"></div>
                <div class="traitgris"></div>
                <div class="traitgris"></div>
              </div>
            </div>
          </div>
        </div>
      </a>
    </li>';	
  }
}
  
  if (isset($recettes))
{
  echo $recettes;
  unset($recettes);
}

?>
</div>


<?php require "src/footer.php"; ?>
</body>
</html>
