<div class="miniacti" id="stock">
<h1>Refaire le stock</h1>
<?php

       

        spl_autoload_register('chargerClasse');
        
        $manager = new PatateManager($db);
        $nombre = $manager->count();
        echo $nombre;
        $listedespatate = $manager->getList();
          $patates = "";
          $patatesenstocke="";
          // On affiche en parcourant le tableau
          //on affiche les pommes de Terre
          foreach ($listedespatate as $patate) 
          {
            $quant=$patate->getQuantite();
            $num=$patate->getNom_patate();
            if($patate->getQuantite()==0){
            $patates .=
            ' <form action="#" method="post">
            <li>
                <div class="produit">
                  <div class="imageproduit">
                    <img src="'.$patate->getImage_patate().'"/>
                  </div>
                  <div class="detailproduit">
                    <h2>'.$patate->getNom_patate().'</h2>
                    <p>'.$patate->getPrix_patate().'€ le kg</p>
                    <p>refaire du stocke </p>
                    <input type="number" class="quant"name="stocke"value="0" min="1";> 
                    <input type="submit"value="Actualiser" name='.htmlspecialchars($num).'>
                  </div>
                </div>
            </li>
            </form>';	}
            else{
            $patatesenstocke.=
            ' <form action="#" method="post">
            <li>
                <div class="produit">
                  <div class="imageproduit">
                    <img src="'.$patate->getImage_patate().'"/>
                  </div>
                  <div class="detailproduit">
                    <h2>'.$patate->getNom_patate().'</h2>
                    <p>'.$patate->getPrix_patate().'€ le kg</p>
                    <p>'.$patate->getQuantite().' kg restant </p>
                    <input type="number" class="quant"name="stocke" value="0" min="1";> 
                    <input type="submit"value="Actualiser" name='.htmlspecialchars($num).'>
                  </div>
                </div>
            </li>
            </form>'; }
            //modifié la quantité
            if(isset($_POST[$num])){
              $lestocke= $_POST['stocke'];
              $lenewstocke=$patate->getQuantite()+ $lestocke;
              $num=$num;
              $manager->restock($lenewstocke,$num);
              echo '<script language="Javascript">
            document.location.replace("pageadmin.php");
            </script>';
            }
          }
          if (isset($patates) or isset($patatesenstocke))
        {
          echo $patates;
          echo $patatesenstocke;
          unset($patatesenstocke);
          unset($patates);
        }

        ?>
</div>