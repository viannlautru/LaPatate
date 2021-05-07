<?php
session_start();
include_once ("function.php");
?>
<nav>
<div class="block">
  <div  class="topnav"id="myTopnav">
    <ul>
      <li>
          <a href="index.php#home" ><img class="logo" src=images/logoPatate.png > </a>
          <a class="icon categorie" onclick="responcive()">
              <i class="fa fa-bars"></i>
            </a>
      </li>
    </ul>
    <div class="menu">
      <ul>
        <li>
          <a href="index.php" >Accueil</a>
        </li>
        <li>
          <a href="lesfournisseurs.php"  >Les Fournisseurs</a>
      </li>
        <li>
          <a href="TouteslesPatates.php">Les patates</a>
        </li>
        <li>
          <a href="achat.php"  >Panier 
            <?php $panier = !empty($_SESSION['panier']) ? $_SESSION['panier'] : NULL;
              if($panier){echo '+'.nbrarticle();} ?></a>
        </li>
        <li>
          <a href="recette.php">Recettes</a>
        </li>
    
      
      </ul>
    </div>
  </div>
</div>
</nav>
<section class="connection">
<?php
//s'il y a une session 
  if(!isset($_SESSION['Nom'])) {?>
  <li>
    <button onclick="window.location.href ='connexion.php';">connexion</button>
	 </li>
   <?php
  }else{
    if($_SESSION['Nom']) {
      if(isset($_SESSION['CLIENT'])){
						echo('
            <li>
						<a href="achat.php">Client</a>
            </li>');}
					elseif(isset($_SESSION['ADMIN'])){
						
						echo('
        <li>
          <a href="pageadmin.php">Admin</a>
        </li>');}
        else{
          session_destroy();
        }
				
					echo(' <li>
                  <a href="bdd/deconnection.php">Déconnexion / </a>
                  </li>');
    }
  }
    ?>
</section>