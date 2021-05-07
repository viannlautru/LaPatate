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
 include_once ("function.php");  ?>

<div class="main">
  <header >
    <div class="debut">
      <h1>Les pommes de terre en stock</h1>
    
    </div>
  </header>
  <div id="form">
    <form action="" method="post">
      <table>
        <tr>
          <th>Variété</th>
          <th>Prix au kilo</th>
          <th>Quantité en kilo</th>
          <th>Prix</th>
          <th><input type="submit" value="tout supprimer" name="totsupp"></th>
          <?php
        if(isset($_POST['totsupp'])){supprimertous();}
        ?>

        </tr>
      <?php
      $panier = !empty($_SESSION['panier']) ? $_SESSION['panier'] : NULL;
      $nbArticles=50;
      for ($i=1 ;$i < $nbArticles ; $i++)
      {
        //affichage dans le tableau les différentes pommes de Terre mis au panier 
        $id = !empty($_SESSION['panier'][$i]) ? $_SESSION['panier'][$i] : NULL;
        $prix = !empty($_SESSION['panier']['prix'.$i]) ? $_SESSION['panier']['prix'.$i] : NULL;
        $kilo = !empty($_SESSION['panier']['kilo'.$i]) ? $_SESSION['panier']['kilo'.$i] : NULL;
        $prixaukilo = !empty($_SESSION['panier']['prixaukilo'.$i]) ? $_SESSION['panier']['prixaukilo'.$i] : NULL;
        
        if(htmlspecialchars($id)==true){
        ?>
        <tr> 
        
        <td><?php echo htmlspecialchars($id);?> </td> 
        <td><?php echo htmlspecialchars($prix);?> </td>
        <td><input type="number"  class="quant"value="<?php echo htmlspecialchars($kilo);?>" min="1" name="<?php echo $id.'1';?>"> </td> 
        <td><?php echo htmlspecialchars($prixaukilo);?> </td>
        <td><input class="supp" type="submit" value=""name="<?php echo $id;?>"> </td> 
        
          <?php 
          //pour modifier la quantité
          $id1=!empty($_POST[$id.'1']) ? $_POST[$id.'1'] : NULL;
          if($id1+1<$id1 Or $id1>$id1-1)
          calculprixpanier($id,$id1);?>
          
        <?php
        //si le bouton supprimer est clické
        if(isset($_POST[$id])){supprimer($id);}
        ?>
        
        
        </tr>
        <?php
        }
      }

      ?>
      <tr class="prixtot">
        <td><input type="submit" value="actualiser" name="actualiser"></td>
        <?php

          if(isset($_POST['actualiser'])){
            echo '<script language="Javascript">
            document.location.replace("achat.php");
            </script>'; }
          ?>
      </table>
    </form>
  </div>
  <div id="paiement">
    <form action="" method="post">
      <table>
      <tr>

          <th class="titretot">Sous-total</th>
          <th><?php   echo prixtotal().'€';?></th>
        </tr>
        <tr class="tot">
          <th class="titretot">Total</th>
          <th><?php   echo prixtotal().'€';?></th>
        </tr>
        </table>
          <input type="submit" value="Valider la commande" name="paiement">
        
     
      <?php
    if(isset($_POST['paiement'])){
      $panier = !empty($_SESSION['panier']) ? $_SESSION['panier'] : NULL;
      if($panier){
      echo '<script language="Javascript">
      document.location.replace("paiement.php");
      </script>'; }else{
        echo "<script>alert(\"Le panier est vide\")</script>";
      }}
    ?>
    </form>

  </div>
</div>
<?php require "src/footer.php"; ?>
</body>
</html>
