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
<?php require "src/nav.php"; 
 if (!isset($_SESSION['CONNECTER'])){ header('Location: index.php'); } 
?>
<div class="main">
<header >
<div class="debut">
  <h1>Présentation de votre recette</h1>
</div>
</header>
<section>
    <div>
        <form action="" method="post" enctype="multipart/form-data">
        <section class="titrelapatate">
    <div id="content">

      <div class="bloccontent">
        <div id="blocgauche">
        <label for="fichier_a_uploader">Image</label>
                  <output id="list"></output>
                  <input type="file" id="image" name="image" data-preview=".preview" placeholder="image" multiple />
                 
        </div>
      </div>
        <div class="bloccontent"> 
          <div id="blocdroite">
            <h1 class="blocheader"><label>Intitulé de la recette</label></br>
					<input type="text" name="Nom" placeholder="Intitulé"/></h1> 
            <h4>Bon comme  
                <select value="Categorie" name="Categorie" type="text">
                <?php
              
                  $req = $db->query("SELECT * FROM categorie");
             
              //on parcour la table des catégories pour la proposer dans une liste
                  while ($donnees = $req->fetch())
                  {
                      $nom = $donnees['Nom_categorie'];
                      $id = $donnees['id_categorie'];
                      ?>
                  <option value="<?php echo $id; ?>"><?php echo $nom; ?></option>
                      <?php
                  }
                          ?>
                  </select>
			</h4>
            <h2 class="blocheader">			<label>Durée de la préparation</label>
					<input type="text" name="Duree" placeholder="Duree"/> Min</h2> 
          </div>
          
    </div>
    
  </div>
      </section>
      <section class="main">
      <div class="recette">
      <div class="positioningredient">
        <div class="ingredient">
          <div class="textingredient">
           <h4><input type="text" name="ingredient0"  placeholder="Ingredient"/>
                    <input type="number" name="quant0"  placeholder="Quantité"/>
                    <input type="text" name="unite0"  placeholder="Unité de mesure"/>
                    <input type="button" onclick="creer();"  value="Ajouter un ingrédient" />
                    <div id="cnt"></div></h4>
          </div>
        </div>
      </div>
      <div class="positionetape">  
        <div class="etape">  
          <div class="textetape">   
            <h4><textarea type="text" name="Etape0" placeholder="Les étapes de préparations"></textarea>
                    <input type="button" onclick="ajoutetape();"  value="Ajouter une étape" />
                    <div id="etape"></div></h4> 
          </div>
        </div>
      </div>
      </section>
      <div id="button">
  <input id="buttonrectte" type="submit" name="newrecette" value="Envoyer la recette"></input>
  </div>

        </form>
    </div>
<?php	
    function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}

spl_autoload_register('chargerClasse');

$manager = new Recettemanager($db);
//si le bouton est clické
		if (isset($_POST['newrecette']))
    {
      //si tous est remplie
      if(!empty($_POST['Nom'])AND !empty($_POST['Duree'])AND !empty($_POST['ingredient0'])AND !empty($_POST['Categorie'])AND !empty($_POST['Etape0']))
        {
          //L'image de la recette
            $envoy="recette/";
            $image =$envoy . basename($_FILES["image"]["name"]);
            $type = array('.png', '.gif', '.jpg', '.tif', '.JPG');#On demande d'avoir que c'est type de fichier
            $types = strrchr($_FILES['image']['name'], '.');#va cherche la dernier occurence d'un caractère dans une chaîne  

            if ($_FILES["image"]["size"] > 2000000) {#si supérieur à 2MO 
                                                      #PB:ne fonctionne pas avec 2MO et les fichiers trop vons directe en echec 
                                                      #avec 1MO cela fonctionne 
                echo "désoler, ton image est trop gros max 2MO";#erreur
              
            }
            else{
                if(!in_array($types, $type)) #A partir d'un tableau il va vérifier le type 
                {
                    echo 'Il n\'y à que les fichiers de type png, gif, jpg, tif qui sont pris en conte';#erreur
                }
                else{
                  if(strlen($image)<50)
                  {
                    $verif = $db->query("SELECT * FROM recette WHERE image_recette='$image' ");
                    $count = $verif->fetchColumn();
                    if($count == 0)
                    {
                      if(move_uploaded_file($_FILES["image"]["tmp_name"],$image))#déplacement d'un fichier 
                      {
                        $n=0;
                        while($n<=50){
                            if(isset($_POST['ingredient'.$n])){
                            $ingredientrecette[]='-'.$_POST['quant'.$n].''.$_POST['unite'.$n].' '.$_POST['ingredient'.$n].'</br>' ;
                            }
                            if(isset($_POST['Etape'.$n])){
                                $etaperecette[]=$n.'.'.$_POST['Etape'.$n].'</br>';
                                }
                            $n++;
                        }
                        //recupération des données de la recette
                        $ingredient = implode($ingredientrecette);
                        $etape = implode($etaperecette);
                        $valid="0";
                        $date = date('d-m-y h:i:s');
                        $newrecette = new Recette([          
                          'Nom_recette'=>$_POST['Nom'],
                          'Duree'=>$_POST['Duree'],
                          'Ingredient'=>$ingredient,
                          'Categorie'=>$_POST['Categorie'],
                          'image_recette'=>$image,
                          'Etape'=>$etape,
                          'Validation'=>$valid,
                          'Date'=>$date,
                          'Auteur'=>$_SESSION['id']]);
                        //création de la nouvelle recette
                          $manager->addrecette($newrecette);
                          echo 'envoyé';
                      } 
                      else{echo "Echec du téléchargement";}
                
                  }
                  else{echo "Ce nom de photo est déjà pris";}
                }
                else{echo"veuillez renomer votre photo";}
              
              }
              }
        }else {
          echo "rentre toute les valueurs";
        }
      
    }
    ?>
    
</section>
</div>


<?php require "src/footer.php"; ?>
</body>
</html>
<script>
    document.getElementById('image').addEventListener('change', handleFileSelect, false);
</script>