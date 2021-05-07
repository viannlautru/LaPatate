<div class="miniacti" id="commande">
<h1>Les commandes</h1>
<?php

       

        spl_autoload_register('chargerClasse');
        
        $manager = new PanierManager($db);
        $listecommande = $manager->getList();
          $patates = "";
          // On affiche en parcourant le tableau
          foreach ($listecommande as $commande) 
          {
            $id=$commande->getid_panier();
            //si des commandes ne sont pas envoyer
            if($commande->getEnvoyer()==0){
            $patates .=
            ' <form action="#" method="post">
            <li>
                <div class="produit">
                  <div class="detailproduit">
                  <p>'.$commande->getNom_panier().'</p>
                    <h2>'.$commande->getPrixtot_panier().'</h2>
                    <p>'.$commande->getDate_panier().'</p>
                    <p>En attente</p>
                    <input type="submit" name='.$id.' value="✓"> 
                  </div>
                </div>
            </li>
            </form>';	}
           
            //passe la validiter du panier à 1 soit valide
            if(isset($_POST[$id])){
              $valid= 1;
              $manager->valider($valid,$id);
              echo '<script language="Javascript">
            document.location.replace("pageadmin.php");
            </script>';
            }
          }
          if (isset($patates))
        {
          echo $patates;
          unset($patates);
        }

        ?>
</div>