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

  <div class="debut">
    <h1>Toutes les variétés de pommes de terre qui existent</h1>
       
      </div>
      <?php

require_once('bdd/connectserv.php');
$db=connect_bd();
function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}

spl_autoload_register('chargerClasse');

$manager = new PatateManager($db);
$nombre = $manager->count();?>
<section class="nombrepatate">
  <h2>Il y a <?php echo $nombre ?> variétés de pommes de terre que nous vendons</h2>
</section>
<?php
$listedespatate = $manager->getList();
  $patates = "";
  // On affiche en parcourant le tableau
  foreach ($listedespatate as $patate) 
  {
    //affichage de toute les pommes de Terre 
    $patates .=
    '<li>
      <a href="laPatate.php?name='.$patate->getNom_patate().'">
        <div class="produit">
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


<?php require "src/footer.php"; ?>
</body>
</html>
