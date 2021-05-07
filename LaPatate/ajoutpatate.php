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
<?php 
//si l'utilisateur à crée une session ADMIN sinon il est redirigé à l'accueil
if (!isset($_SESSION['ADMIN'])){ header('Location: index.php'); } ?>
<div class="debut">
  <h1>Ajout d'une patate au magasin</h1>
  <form method="POST" enctype="multipart/form-data" >
    <fieldset>
			<legend>Ajout d'une patate au magasin</legend>
			
				<li>
					<label>Nom</label>
					<input type="text" name="Nom" placeholder="Nom"/>
				</li>
                <li>
					<label>Origine</label>
					<input type="text" name="Origine" placeholder="Origine"/>
				</li>
				<li>
					<label>Couleure</label>
					<input type="text" name="Couleur" placeholder="Couleure"/>
				</li>
                <li>
					<label>Prix au kg</label>
					<input type="round" name="Prix" placeholder="Prix">
                </li>
                <li>
                  <label for="fichier_a_uploader">Image</label>
                  <input type="file" id="image" name="image" placeholder="image"/>
                </li>
                <li>
					<label>Texte</label>
					<textarea type="text" name="Texte" placeholder="Texte"></textarea>
				</li>
				<input type="submit" name="newpatate" value="Envoyer"/>

		</fieldset>	

<?php
function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}

spl_autoload_register('chargerClasse');

$manager = new PatateManager($db);
//si le bouton est clické
		if (isset($_POST['newpatate']))
    {
      //si tous est remplie
      if(!empty($_POST['Nom'])AND !empty($_POST['Origine'])AND !empty($_POST['Couleur'])AND !empty($_POST['Prix'])AND !empty($_POST['Texte']))
        {
          //si le nom de pomme de terre n'est pas déja pris
          if($manager->getpatate($_POST['Nom'])==False)
          {
            $envoy="reservee/";
            $image =$envoy . basename($_FILES["image"]["name"]);
            $type = array('.png', '.gif', '.jpg', '.tif', '.JPG');#On demande d'avoir que c'est type de fichier
            $types = strrchr($_FILES['image']['name'], '.');#va cherche la dernier occurence d'un caractère dans une chaîne  

            if ($_FILES["image"]["size"] > 2000000) {#si supérieur à 2MO 
                                                      #PB:ne fonctionne pas avec 2MO et les fichiers trop vons directe en echec 
                                                      #avec 1MO cela fonctionne 
                echo "désoler, ton fichier est trop gros max 2MO";#erreur
              
            }
            else{
                if(!in_array($types, $type)) #A partir d'un tableau il va vérifier le type 
                {
                    echo 'Il n\'y à que les fichiers de type png, gif, jpg, tif qui sont pris en conte';#erreur
                }
                else{
                  if(strlen($image)<50)
                  {
                    $verif = $db->query("SELECT * FROM patate WHERE Image_patate='$image' ");
                    $count = $verif->fetchColumn();
                    if($count == 0)
                    {
                      if(move_uploaded_file($_FILES["image"]["tmp_name"],$image))#déplacement d'un fichier 
                      {
                        //Si tous est bon on créer la pomme de terre en objet afin de la mettre dans la base de donnée
                        $newpatate = new Patate([          
                          'Nom_patate'=>$_POST['Nom'],
                          'Origine_patate'=>$_POST['Origine'],
                          'Couleur_patate'=>$_POST['Couleur'],
                          'Prix_patate'=>$_POST['Prix'],
                          'Image_patate'=>$image,
                          'Texte_patate'=>$_POST['Texte']]);
                          $manager->addpatate($newpatate);
                          echo 'envoyé';
                      } 
                      else{echo "Echec du téléchargement";}
                
                  }
                  else{echo "Ce nom de photo est déjà pris";}
                }
                else{echo"veuillez renomer votre photo";}
              
              }
              }
    
          }else
          {
              echo ("Patate déja existant");
          }
        }else {
          echo "rentre toute les valueurs";
        }
      
    }
?>

</form>







</div>
</header>

</div>


<?php require "src/footer.php"; ?>
</body>
</html>
