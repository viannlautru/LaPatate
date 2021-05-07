<?php
//partie ou l'on gère les produits acheter 
//création de Session pour les achats
function ajout($article)
{
    $n=1;
        while($n<=50){
            $id = !empty($_SESSION['panier'][$n]) ? $_SESSION['panier'][$n] : NULL;
            if(htmlspecialchars($id) == $article['id']){
                $kilo = !empty($_SESSION['panier']['kilo'.$n]) ? $_SESSION['panier']['kilo'.$n] : NULL;
                htmlspecialchars($kilo);
                $kilo+=1;
                $_SESSION['panier']['kilo'.$n] = $kilo;
                calculprix($n,$kilo);
                $n=50;
            }elseif(!isset($_SESSION['panier'][$n])){
                $_SESSION['panier'][$n] = $article['id'];
                $_SESSION['panier']['kilo'.$n] = $article['kilo'];
                $_SESSION['panier']['prix'.$n] = $article['prix']; 
                $_SESSION['panier']['prixaukilo'.$n] = $article['prix']*$article['kilo'];
                
                $n=50;
            }
            $n++;
        } 

    
}
//recupere dans toute les sessions prixau kilo et on les additionne entre elle 
function prixtotal(){
    $n=1;
    $prix=0;
    while($n<=50){
        $ids = !empty($_SESSION['panier'][$n]) ? $_SESSION['panier'][$n] : NULL;
        if($ids){
            $prixaukilo = !empty($_SESSION['panier']['prixaukilo'.$n]) ? $_SESSION['panier']['prixaukilo'.$n] : NULL;
            htmlspecialchars($prixaukilo);
            $prix=$prixaukilo+$prix;
        }
        
        $n++;
    } 
    return $prix;
}
//on Compte le nombre d'article acheter 
function nbrarticle(){
    $n=1;
    $article=0;
    while($n<=50){
        $ids = !empty($_SESSION['panier'][$n]) ? $_SESSION['panier'][$n] : NULL;
        if($ids){
            $article+=1;
        }
        
        $n++;
    } 
    return $article;
}

function calculprix($id,$kilo)
{
    $prix = !empty($_SESSION['panier']['prix'.$id]) ? $_SESSION['panier']['prix'.$id] : NULL;
    htmlspecialchars($prix);
    $_SESSION['panier']['prixaukilo'.$id] = $prix*$kilo;
}

//Change le prix en fonction du nombre de kilo changé sur l'id qui y correspond
function calculprixpanier($idpat,$kilo)
{
    $n=1;
    while($n<=50){
        $ids = !empty($_SESSION['panier'][$n]) ? $_SESSION['panier'][$n] : NULL;
        if(htmlspecialchars($ids) == $idpat){
            $prix = !empty($_SESSION['panier']['prix'.$n]) ? $_SESSION['panier']['prix'.$n] : NULL;
            htmlspecialchars($prix);
            $_SESSION['panier']['kilo'.$n] = $kilo;
            $_SESSION['panier']['prixaukilo'.$n] = $prix*$kilo;
        }
        $n++;
    } 
    
}
//on supprime la session de l'id choisi
function supprimer($idpat){
    $n=1;
        while($n<=50){
            $ids = !empty($_SESSION['panier'][$n]) ? $_SESSION['panier'][$n] : NULL;
            if(htmlspecialchars($ids) == $idpat){
                unset($_SESSION['panier'][$n]);
                unset($_SESSION['panier']['kilo'.$n]);
                unset($_SESSION['panier']['prix'.$n]);
                unset($_SESSION['panier']['prixaukilo'.$n]);
                echo '<script language="Javascript">
                            document.location.replace("achat.php");
                            </script>'; 
                $n=50;
            }
            $n++;
        } 
  
}
//on supprime toute les sessions panier 
function supprimertous(){
    unset($_SESSION['panier']);
    echo '<script language="Javascript">
    document.location.replace("achat.php");
    </script>'; 
}
?>