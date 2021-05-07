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
  <h1>Connecter vous</h1>
  
  <form action="" method="post">
    <fieldset>
			<legend>Connecter vous</legend>
      <div class="form-content">
			<ol class="conect">
        <li>
					<label>Mail</label></br>
					<input type="text" name="mail" placeholder="Ecrire sont Mail ici">
				</li>
				<li>
					<label>mot de passe</label></br>
					<input type="password" name="pwd" placeholder="Ecrire sont mot de passe ici">
				</li>
				<input type="submit" name="connexion" value="Envoyer">
			</ol>
      <a href="inscription.php">S'inscrire</a>
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
//si le bouton est clické
		if (isset($_POST['connexion']))
    {
      //si tous est remplie
      if(!empty($_POST['mail']) AND !empty($_POST['pwd']))
      {
        $password=$_POST['pwd'];
        $password=md5($password);
        if($manager->getConnextion($_POST['mail'],$password)==TRUE)
        {
        echo"Connecté".$_SESSION['Nom'];
        
        }elseif($manager->getConnextionAdmin($_POST['mail'],$password)==TRUE){
          echo"Connecté".$_SESSION['Nom'];
          //création d'une SESSION

        }
        
        
        else {
          echo "Mot de passe ou mail incorrect";
        }
      }else
      {
          echo ("rentre toute les valueurs");
      }
    }
?>
</div>
</header>

</div>


<?php require "src/footer.php"; ?>
</body>
</html>
