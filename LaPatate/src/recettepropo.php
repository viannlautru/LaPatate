<div class="miniacti" id="recette">
<h1>Les recettes</h1>
<?php
        spl_autoload_register('chargerClasse');
        
        $manager = new recetteManager($db);
        $listerecette = $manager->getList();
        
          $recette = "";
          // On affiche en parcourant le tableau
          //on affiche les recettes
          foreach ($listerecette as $recettes) 
          {
            $id=$recettes->getId_recette();
            if($recettes->getValidation()==0){
            $recette .=
            ' <form action="#" method="post">
            <li>
                <div class="produit">
                  <div class="detailproduit">
                  <p>'.$recettes->getNom_recette().'</p>
                    <h2>'.$recettes->getDuree().'</h2>
                    <p>'.$recettes->getCategorie().'</p>
                    <p>En attente</p>
                    <input type="submit" name='.$id.' value="✓"> 
                  </div>
                </div>
            </li>
            </form>';	}
           
            //on passe la validation de la recette à 1 soit accepté
            if(isset($_POST[$id])){
              $valider= 1;
              $manager->valider($valider,$id);
              echo '<script language="Javascript">
            document.location.replace("pageadmin.php");
            </script>';
            }
          }
          if (isset($recette) )
        {
          echo $recette;
          unset($recette);
        }

        ?>
</div>