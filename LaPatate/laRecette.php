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
<?php include_once ("function.php"); ?>

<?php
    
    require_once('bdd/connectserv.php');
    $db=connect_bd();
    function chargerClasse($classname)
    {
      require 'class/'.$classname.'.class.php';
    }

    spl_autoload_register('chargerClasse');
    $manager = new Recettemanager($db);
    $larecette = $manager->get($_GET['recette']);

	if (htmlspecialchars($_GET["recette"]))
	{
		// On récupère la liste des recettes et on met les résultats dans un tableau
    //on affiche la recette
    $Recette = 
    '<section class="titrelapatate">
    <div id="content">

      <div class="bloccontent">
        <div id="blocgauche">
          <img src="'.$larecette->getimage_recette().'">
        </div>
      </div>
        <div class="bloccontent"> 
          <div id="blocdroite">
            <h1 class="blocheader">'.$larecette->getNom_recette().'</h1> 
            <h4>Bon comme '.$manager->getlacategorie($larecette->getCategorie()).'</h4>
            <h2 class="blocheader">'.$larecette->getDuree().' Min </h2> 
           
            <h4>Date de publication:'.$larecette->getDate().'</h4>
          </div>
          
    </div>
    
  </div>
      </section>
      <section class="main">
      <div class="recette">
      <div class="positioningredient">
        <div class="ingredient">
          <div class="textingredient">
           <h4>'.$larecette->getingredient().'</h4>
          </div>
        </div>
      </div>
      <div class="positionetape">  
        <div class="etape">  
          <div class="textetape">   
            <h4>'.$larecette->getEtape().'</h4> 
          </div>
        </div>
      </div>
      </section>
      
';
		
  }
  if(isset($Recette)){
		echo $Recette;
	}

?>
</div>
<?php require "src/footer.php"; ?>
</body>
</html>
