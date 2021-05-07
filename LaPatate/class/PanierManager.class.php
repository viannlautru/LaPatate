<?php
class PanierManager implements iterator
{
    private $_db;
    // Le seul attribut de cette classe Manager
    private $_art = 0;
    private $_panier;
    
    public function current()
	{
		return $this->_panier[$this->_art];
	}
	public function key()
	{
		return $this->_art;
	}
	public function erreur()
	{
		alert ("Non valide");
		return $this->_art=0;
	}
	public function next()
	{
		return $this->_art++;
	}	
	public function return()
	{
		return $this->_art--;
	}
	public function rewind()
	{
		return $this->_art=0;
	}
	public function valid()
	{
		return isset($this->_panier[$this->_art]);
    }
    public function __construct($db)
	{
		$this->setDB($db); // on passe par un setter 
		$this->_panier = $this->getList();
    }
    //insertion dans la base de donnée
    public function addpanier(panier $panier)
        {               
                        $q = $this->_db->prepare('INSERT INTO panier(Prixtot_panier,Date_panier,Adresse_panier,Nom_panier,Prenom_panier,Mail_panier,Tel_panier,nombrearticle_panier) VALUES(:Prixtot_panier, :Date_panier, :Adresse_panier, :Nom_panier, :Prenom_panier, :Mail_panier, :Tel_panier, :nombrearticle_panier)');	
                        $q->bindValue(':Prixtot_panier', $panier->getPrixtot_panier());
                        $q->bindValue(':Date_panier', $panier->getDate_panier());
                        $q->bindValue(':Adresse_panier', $panier->getAdresse_panier());
                        $q->bindValue(':Nom_panier', $panier->getNom_panier());
                        $q->bindValue(':Prenom_panier', $panier->getPrenom_panier());
                        $q->bindValue(':Mail_panier', $panier->getMail_panier());
                        $q->bindValue(':Tel_panier', $panier->getTel_panier());
                        $q->bindValue(':nombrearticle_panier', $panier->getnombrearticle_panier());
                        $q->execute();
                        
                
        }
        //parcour la base de donnée et créé des objets 
        public function getList()
        {
            $panier = [];
            $q = $this->_db->query('SELECT * FROM panier ORDER BY Date_panier');
            while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
            {
                $panier[] = new Panier($donnees);
            }
            return $panier; // On retourne un tableau d'objets panier
        }
        //vérifie si c'est le bon panier 
        public function getpanier($Nom,$MailP)
	    {
		$MailP = (string) $MailP;
        $Nom = (string) $Nom;
		$q = $this->_db->query("SELECT id_panier FROM panier Where Mail_panier ='$MailP' and Nom_panier='$Nom' ORDER BY id_panier DESC limit 1");
        $donnees = $q->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                return TRUE;
            }else{
                return False;
            }
		// On retourne du boolean
		
        }
        //vérifie si l'id est le bon 
        public function getid($Nom,$MailP)
	    {
		$MailP = (string) $MailP;
        $Nom = (string) $Nom;
		$q = $this->_db->prepare("SELECT * FROM panier Where Mail_panier =:mail and Nom_panier=:nom ORDER BY id_panier DESC limit 1");
        $q->execute(array('mail'=>$MailP,'nom'=>$Nom));
        $results = $q->fetch();
            if($results){
                return $results['id_panier'];
            }else{
                return False;
            }
		// On retourne un resultat si il y en a un
		
        }
        //Modifie la validité du panier 
        public function valider($valider,$id)
        {
            $valider= (int)$valider;
            $panier=$this->_db->prepare("UPDATE `panier` SET `Envoyer`=$valider where `id_panier`='$id';");
            $panier->execute();
    
        }


        public function setDb(PDO $db)
        {
            $this->_db = $db;
        }
    

}
?>