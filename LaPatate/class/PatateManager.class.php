<?php
class PatateManager implements iterator
{
    private $_db;
    // Le seul attribut de cette classe Manager
    private $_pat = 0;
    private $_patate;
    
    public function current()
	{
		return $this->_patate[$this->_pat];
	}
	public function key()
	{
		return $this->_pat;
	}
	public function erreur()
	{
		alert ("Non valide");
		return $this->_pat=0;
	}
	public function next()
	{
		return $this->_pat++;
	}	
	public function return()
	{
		return $this->_pat--;
	}
	public function rewind()
	{
		return $this->_pat=0;
	}
	public function valid()
	{
		return isset($this->_patate[$this->_pat]);
    }
    public function __construct($db)
	{
		$this->setDB($db); // on passe par un setter 
		$this->_patate = $this->getList();
    }
     //insertion dans la base de donnée
    public function addpatate(Patate $patate)
        {          
                        $q = $this->_db->prepare('INSERT INTO patate(Nom_patate,Origine_patate,Couleur_patate,Prix_patate,Image_patate,Texte_patate) VALUES(:Nom_patate, :Origine_patate, :Couleur_patate, :Prix_patate, :Image_patate, :Texte_patate)');	
                        $q->bindValue(':Nom_patate', $patate->getNom_patate());
                        $q->bindValue(':Origine_patate', $patate->getOrigine_patate());
                        $q->bindValue(':Couleur_patate', $patate->getCouleur_patate());
                        $q->bindValue(':Prix_patate', $patate->getPrix_patate());
                        $q->bindValue(':Image_patate', $patate->getImage_patate());
                        $q->bindValue(':Texte_patate', $patate->getTexte_patate());
                        $q->execute();
                        
                
        }
        //compte le nombre pomme de Terre qu'il est dans la base de données
        public function count()
        {
            // Retourne tous les patates 
            $patates = $this->_db->query('SELECT count(*) FROM patate');
            $count2 = $patates->fetchColumn();
            return $count2; // On retourne un tableau d'objets patate
        }
        //list toutes les pommes de Terre
        public function getList()
        {
            // Retourne tous les patates 
            $patates = [];
            $q = $this->_db->query('SELECT * FROM patate ORDER BY Nom_patate');
            while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
            {
                $patates[] = new Patate($donnees);
            }
            return $patates; // On retourne un tableau d'objets patate
        }

        //Vérifie si la pomme de Terre existe 
        public function getpatate($Nom)
	    {
        $Nom = (string) $Nom;
		$patate = $this->_db->query("SELECT * FROM patate Where Nom_patate ='$Nom' ");
        $donnees = $patate->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                return True;
            }else{
                return False;
            }
		// On retourne du boolean
		
        
    }
    //Refais du stock 
    public function restock($quantite,$num)
    {
        $quantite= (int)$quantite;
        $patate=$this->_db->prepare("UPDATE `patate` SET `Quantite`=$quantite where `Nom_patate`='$num';");
        $patate->execute();

    }
       
       //recupère le nom de la pomme de Terre 
        public function get($nomP)
	    {
		$nomP = (string) $nomP;
		$q = $this->_db->query("SELECT * FROM patate Where Nom_patate ='$nomP'");
        $donnees = $q->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                return new Patate($donnees);
            }else{
                return False;
            }
		// On retourne un objet de type patate
		
        }



        public function setDb(PDO $db)
        {
            $this->_db = $db;
        }
    

}
?>