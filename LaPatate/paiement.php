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
 include_once ("function.php");  ?>

<div class="main">
<div class="debut">
<header >

  <h1>Le paiement en ligne</h1>
 

</header>
<form action="" method="post">
  
<fieldset>
			<legend>Paiement de vos articles </legend>
      <div class="form-content">
			<ol class="conect">
			<?php 
      //si la personne est connecter on recupère c'est donnée pour prés remplire le formulaire 
      if (!isset($_SESSION['CONNECTER'])){?>
				<li>
					<label>Nom</label></br>
					<input type="text" name="Nom" placeholder="Votre Nom">
				</li>
				<li>
					<label>Prénom</label></br>
					<input type="text" name="Prenom" placeholder="Votre Prénom">
				</li>
        <li>
					<label>Mail</label></br>
					<input type="text" name="mail" placeholder="Votre Mail">
				</li>
				<li>
					<label>Adresse</label></br>
					<input type="text" name="Adress" placeholder="Votre Adresse complette">
				</li>
				<li>
					<label>Téléphone</label></br>
					<input type="tel" name="tel" placeholder="Votre Téléphone" >
				</li>
				<input type="submit" name="envoye" value="Envoyer">

          <li>Totale</li>
          <li><?php   echo prixtotal().'€';?></li>
          <?php }
          //sinon à la personne de le remplire 
          else{?>
            <li>
					<label>Nom</label></br>
					<input type="text" name="Nom" value="<?php echo $_SESSION['Nom']?>">
				</li>
				<li>
					<label>Prénom</label></br>
					<input type="text" name="Prenom" value="<?php echo $_SESSION['Prenom']?>">
				</li>
        <li>
					<label>Mail</label></br>
					<input type="text" name="mail" value="<?php echo $_SESSION['Mail']?>">
				</li>
				<li>
					<label>Adresse</label></br>
					<input type="text" name="Adress" value="<?php echo $_SESSION['Adresse']?>">
				</li>
				<li>
					<label>Téléphone</label></br>
					<input type="tel" name="tel" placeholder="Votre Téléphone" >
				</li>
				<input type="submit" name="envoye" value="Envoyer">

          <li>Total</li>
          <li><?php   
          //on affiche le prix totale
          echo prixtotal().'€';?></li>
            <?php }?>
			</ol>
    </div>
		</fieldset>	
    <?php
    function chargerClasse($classname)
    {
      require 'class/'.$classname.'.class.php';
    }

spl_autoload_register('chargerClasse');

$manager = new PanierManager($db);
    //Si le bouton est clické
		if (isset($_POST['envoye']))
    {
      //on vérifie si tous est remplie
      if(!empty($_POST['Nom']) AND !empty($_POST['Prenom']) AND !empty($_POST['mail'])AND !empty($_POST['Adress']) AND !empty($_POST['tel']))
        {
            $date = date('d-m-y h:i:s');
            // On récupère la liste les données de l'achat et on met les résultats dans un tableau
            $newpanier = new Panier([
              'Prixtot_panier'=>prixtotal(),
              'Date_panier'=>$date,
              'Adresse_panier'=>$_POST['Adress'],
              'Nom_panier'=>$_POST['Nom'],
              'Prenom_panier'=>$_POST['Prenom'],
              'Mail_panier'=>$_POST['mail'],
              'Tel_panier'=>$_POST['tel'],
              'nombrearticle_panier'=>nbrarticle()]);
            //on créer un nouveau panier pour y mettre les article
            $manager->addpanier($newpanier);
            if($manager->getpanier($_POST['Nom'],$_POST['mail'])== TRUE){
                $managers = new ArticleManager($db);
                $panier = !empty($_SESSION['panier']) ? $_SESSION['panier'] : NULL;
                $nbArticles=count($panier);
                $idpanier=$manager->getid($_POST['Nom'],$_POST['mail']);

                for ($i=1 ;$i < $nbArticles ; $i++)
                {
                  $id = !empty($_SESSION['panier'][$i]) ? $_SESSION['panier'][$i] : NULL;
                  $kilo = !empty($_SESSION['panier']['kilo'.$i]) ? $_SESSION['panier']['kilo'.$i] : NULL;
                  $prixaukilo = !empty($_SESSION['panier']['prixaukilo'.$i]) ? $_SESSION['panier']['prixaukilo'.$i] : NULL;
                  if(htmlspecialchars($id)==true){
                  $newarticle= new Article([
                    'Nom_article'=>$id,
                    'Quantite_article'=>$kilo,
                    'Prix_article'=>$prixaukilo,
                    'Panier_article'=>$idpanier]);
                  //création des article pour le panier
                  $managers->addarticle($newarticle);
                  }
                   }
               
            }else{
                echo 'Erreur dans le Panier';
            }
        }else {
          echo "rentre toute les valueurs";
        }
      
    }
  ?>
<form>
  </div>
  </div>
<?php require "src/footer.php"; ?>
</body>
</html>
