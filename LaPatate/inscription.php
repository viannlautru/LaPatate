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
<div class="debut">
  <h1>Inscriver vous </h1>
  <form action="" method="post">
    <fieldset>
			<legend>Inscriver vous </legend>
			<div class="form-content">
			<ol class="conect">
			
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
					<input type="text" name="Adress" placeholder="Votre Adresse">
				</li>
				<li>
					<label>mot de passe</label></br>
					<input type="password" name="pwd" placeholder="mot de passe">
				</li>
				<input type="submit" name="newclient" value="Envoyer">
			</ol>
      </div>
		</fieldset>	
  </form>
<?php
function chargerClasse($classname)
{
  require 'class/'.$classname.'.class.php';
}

spl_autoload_register('chargerClasse');

$manager = new ClientManager($db);
		if (isset($_POST['newclient']))
    {
      if(!empty($_POST['Nom']) AND !empty($_POST['Prenom']) AND !empty($_POST['mail'])AND !empty($_POST['Adress']) AND !empty($_POST['pwd']))
        {
          if($manager->getInscription($_POST['mail'])==False)
          {
              $password=$_POST['pwd'];
              $password=md5($password);
            // On récupère la liste du client et on met les résultats dans un tableau
            $newclient = new Client([
              'Prenom_client'=>$_POST['Prenom'],
              'Nom_client'=>$_POST['Nom'],
              'Mail_client'=>$_POST['mail'],
              'Adresse_client'=>$_POST['Adress'],
              'PWD_client'=>$password]);
            //on créer un nouveau client 
            $manager->add($newclient);
        
    
          }else
          {
              echo ("Compte déja existant");
          }
        }else {
          echo "rentre toute les valueurs";
        }
      
    }
?>









</div>
</header>

</div>


<?php require "src/footer.php"; ?>
</body>
</html>
