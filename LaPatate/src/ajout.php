<div class="miniacti ajout" id="ajout">
  <h1>Ajout d'une pomme de terre au magasin</h1>
  <form method="POST" enctype="multipart/form-data" >
    <div class="formpatate">
				<li class="nom">
	
					<input type="text" name="Nom" placeholder="Nom"/>
				</li>
                <li class="origine">

					<input type="text" name="Origine" placeholder="Origine"/>
				</li>
				<li class="couleur">
	
					<input type="text" name="Couleur" placeholder="Couleur"/>
				</li>
                <li class="prix">
		
					<input type="round" name="Prix" placeholder="Prix au kg">
                </li>
                <li class="image">
                  <label for="fichier_a_uploader">Image</label></br>
                  <input type="file" id="image" name="image" placeholder="image"/>
                </li>
                <li class="text">
					<textarea type="text" name="Texte" placeholder="Texte"></textarea>
				</li>
        <li class="bouton">
				<input type="submit"class="boutoncli" name="newpatate" value="Envoyer"/>
      </li>
    </div>  


<?php

    $manager = new PatateManager($db);
    //bouton clické
		if (isset($_POST['newpatate']))
    {
      //si tous est remplie
      if(!empty($_POST['Nom'])AND !empty($_POST['Origine'])AND !empty($_POST['Couleur'])AND !empty($_POST['Prix'])AND !empty($_POST['Texte']))
        {
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
                        //création d'une patate
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