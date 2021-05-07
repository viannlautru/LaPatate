<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/Style.css" rel="stylesheet">
<script src="script/script.js"></script>
</head>
<body id="home">
<?php require "src/nav.php"; ?>

<header >
<div class="accueil">
  <h1>Bienvenue sur le site de la patate</h1>
</div>
<section class="transition">
<img class="imageheader" src=images/header.jpg >
</section>
</header>
<div class="main">
<section class="bonjour" id="bonjour">
<h1>Bonjour<h1>
  <h2>Présentation</h2>
  <div class="trait"></div>
  <p>Nous sommes une petite équipe de producteurs de pommes de terre qui, dans ces temps bien difficiles, cherchent
   à vendre sa belle production. C'est pour cela 
    que l'on a mis en place ce site de vente en ligne où vous pourrez acheter nos pommes de terre que nous vous livrerons à votre domicile.
    
</section>
<section class="blocphoto">
<div class="cadrephoto">
    <div class="placephoto">
      <div class="photo">
      <img class="taillephoto" src=images/champ2.jpg >
    </div>
    </div>
  </div>  
  <div class="cadrephoto">
    <div class="placephoto placephototun">
      <div class="photo">
      <div class="textphoto textphotoun"> 
        <h2>Ventes</h2>
        <p>On vous propose un grand nombre de pommes de terre cultivées par nos plus grands
         soins afin que vous puissiez vous régaler.
        </p>
        </div>
    </div>
    </div>
  </div>
  <div class="cadrephoto">
    <div class="placephoto">
      <div class="photo">
      <img class="taillephoto" src=images/fleur.jpg >
    </div>
    </div>
  </div>
  <div class="cadrephoto">
    <div class="placephoto">
      <div class="photo">
      <img class="taillephoto" src=images/champ.jpg >
    </div>
    </div>
  </div>
</section>
<section class="blocphoto">
<div class="cadrephotodif">
    <div class="placephoto">
      <div class="photo">
      <img class="taillephoto" src=images/agriculteur.jpg >
    </div>
    </div>
  </div>  
  <div class="cadrephoto">
    <div class="placephoto placephototdeux">
      <div class="photo">
        <div class="textphoto textphotodeux"> 
        <h2>Recettes</h2>
        <p>Nous vous proposons quelques recettes à faire avec les pommes de terre, 
        et vous pouvez nous en envoyer pour, peut-être, les partager sur notre site.
        </p>
        </div>
    </div>
    </div>
  </div>
  <div class="cadrephoto">
    <div class="placephoto">
      <div class="photo">
      <img class="taillephoto" src=images/terre.jpg >
    </div>
    </div>
  </div>
</section>
<div class="traitnoir"></div>
<section class="presentpomme">
<h1>Les ventes</h1>
<div class="marquee">
  <div class="track">
   <!-- L'objet parcourt 8px chaque 1ms -->
   <?php
   //On va chercher les fichier .class
require_once('bdd/connectserv.php');
$db=connect_bd();
function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}

spl_autoload_register('chargerClasse');

$manager = new PatateManager($db);
$listedespatate = $manager->getList();
  $patates = "";
  // On affiche en parcourant le tableau des pommes de Terre
  foreach ($listedespatate as $patate) 
  {
    $patates .=
    '
        <li class="propose">
          <a href="laPatate.php?name='.$patate->getNom_patate().'">
            <div class="produits">
              <div class="placeproduit">
                <div class="dimenproduit">
                  <div class="imageproduit">
                <img src="'.$patate->getImage_patate().'"/>
                  </div>
                </div>
              </div>
              <div class="placedetailproduit">
                <div class="dimedetailproduit">
                  <div class="detailproduit">
                <h2>'.$patate->getNom_patate().'</h2>
                <p>'.$patate->getPrix_patate().' € le kg</p>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </li>';	
  }
  if (isset($patates))
{
  echo $patates;
  unset($patates);
}

?>
</div>
</div>
</section>
<div class="traitnoir"></div>
<section class="presentrecette">
<h1>Les recettes</h1>
<marquee width="100%" direction="left"scrollamount="8" scrolldelay="1">
   <!-- L'objet parcourt 2px chaque 10ms -->
   <?php

$manager = new Recettemanager($db);
$listerecettes = $manager->getList();
  $recettes = "";
  // On affiche en parcourant le tableau des recettes
  
  foreach ($listerecettes as $recette) 
  {
    //si la recette est valide
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
</marquee>
</section>
</div>



<?php require "src/footer.php"; ?>
</body>
</html>
