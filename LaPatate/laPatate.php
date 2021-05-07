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
    $manager = new PatateManager($db);
    $lapatate = $manager->get($_GET['name']);
    

	if (htmlspecialchars($_GET["name"]))
	{
		// On récupère la liste des Pommes de Terre et on met les résultats dans un tableau
    //Affichage de chaque pomme de Terre
    $Patate = 
    ' <section class="titrelapatate">
    <form action="#" method="post">
    <div id="content">

      <div class="bloccontent">
        <div id="blocgauche">
          <img src="'.$lapatate->getImage_patate().'">
        </div>
      </div>
        <div class="bloccontent"> 
          <div id="blocdroite">
            <h1 class="blocheader">'.$lapatate->getNom_patate().'</h1> 
            <h2 class="blocheader">'.$lapatate->getOrigine_patate().'</h2> 
            <h4>'.$lapatate->getPrix_patate().'€ le kg</h4>
            <h4>De couleur '.$lapatate->getCouleur_patate().'</h4>
            <h4>'.$lapatate->getTexte_patate().'</h4> 
          </div>
          
    </div>
    
  </div>
  <div id="button">
  <input id="buttonpatate" type="submit" name="achat" value="Acheter dès maintenant!"></input>
  </div>
        </form>
      </section>
    ';
		
  }
  //si le bouton est clické
  if(isset($_POST['achat'])){
    //on récupère l'id le kilo et le prix pour tous mettre dans un tableau
    $article = array();
    $article['id'] = $lapatate->getNom_patate();
    $article['kilo']= 1;
    $article['prix'] = $lapatate->getPrix_patate();
    //On créer une session pomme de Terre pour le panier
    ajout($article);
    echo '<script language="Javascript">
            document.location.replace("");
            </script>'; 
  }
  
  if(isset($Patate)){
		echo $Patate;
	}
?>

</div>
<?php require "src/footer.php"; ?>
</body>
</html>
