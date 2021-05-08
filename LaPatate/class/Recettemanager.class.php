<?php
class recetteManager implements iterator
{
    private $_db;
    // Le seul attribut de cette classe Manager
    private $_res = 0;
    private $_recette;
    
    public function current()
	{
		return $this->_recette[$this->_res];
	}
	public function key()
	{
		return $this->_res;
	}
	public function erreur()
	{
		alert ("Non valide");
		return $this->_res=0;
	}
	public function next()
	{
		return $this->_res++;
	}	
	public function return()
	{
		return $this->_res--;
	}
	public function rewind()
	{
		return $this->_res=0;
	}
	public function valid()
	{
		return isset($this->_recette[$this->_res]);
    }
    public function __construct($db)
	{
		$this->setDB($db); // on passe par un setter 
		$this->_recette = $this->getList();
    }
     //insertion dans la base de donnée
    public function addrecette(Recette $recette)
        {                   
                        //insertion dans la table recette
                        $q = $this->_db->prepare('INSERT INTO recette(Nom_recette,Duree,ingredient,Categorie,image_recette,Etape,Validation,Date,Auteur)
                         VALUES(:Nom_recette, :Duree, :ingredient, :Categorie, :image_recette, :Etape, :Validation, :Date, :Auteur)');	
                        $q->bindValue(':Nom_recette', $recette->getNom_recette());
                        echo $recette->getNom_recette();
                        $q->bindValue(':Duree', $recette->getDuree());
                        echo $recette->getDuree();
                        $q->bindValue(':ingredient', $recette->getingredient());
                        echo $recette->getingredient();
                        $q->bindValue(':Categorie', $recette->getCategorie());
                        echo $recette->getCategorie();
                        $q->bindValue(':image_recette', $recette->getimage_recette());
                        echo $recette->getimage_recette();
                        $q->bindValue(':Etape', $recette->getEtape());
                        echo $recette->getEtape();
                        $q->bindValue(':Validation', $recette->getValidation());
                        echo $recette->getValidation();
                        $q->bindValue(':Date', $recette->getDate());
                        $q->bindValue(':Auteur', $recette->getAuteur());
                        echo $recette->getAuteur();
                        echo $recette->getDate();
                        $q->execute();
                        
                
        }
        public function getList()
        {
            // Retourne toute les recettes 
            $recette = [];
            $q = $this->_db->query('SELECT * FROM recette');
            while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
            {
                $recette[] = new Recette($donnees);
            }
            return $recette; // On retourne un tableau d'objets recette
        }
   
        public function get($nomP)
	    {
		$nomP = (string) $nomP;
		$q = $this->_db->query("SELECT * FROM recette Where Id_recette ='$nomP'");
        $donnees = $q->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                return new Recette($donnees);
            }else{
                return False;
            }
		// On retourne un objet de type Recette
		
        }
        
        public function valider($valider,$id)
        {
            $valider= (int)$valider;
            $recette=$this->_db->prepare("UPDATE `recette` SET `Validation`=$valider where `Id_recette`='$id';");
            $recette->execute();
    
        }
        public function getlacategorie($idcate)
	    {
		$idcate = (int) $idcate;
		$q = $this->_db->query("SELECT * FROM categorie Where id_categorie ='$idcate'");
        $donnees = $q->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                return $donnees['Nom_categorie'];
            }else{
                return False;
            }
		// On retourne le nom de la categorie
		
        }
        public function setDb(PDO $db)
        {
            $this->_db = $db;
        }
    

}
?>