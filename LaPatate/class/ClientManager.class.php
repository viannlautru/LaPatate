<?php

class ClientManager implements iterator
{
    private $_db;
    // Le seul attribut de cette classe Manager
    private $_cli = 0;
    private $_client;
    
    public function current()
	{
		return $this->_client[$this->_cli];
	}
	public function key()
	{
		return $this->_cli;
	}
	public function erreur()
	{
		alert ("Non valide");
		return $this->_cli=0;
	}
	public function next()
	{
		return $this->_cli++;
	}	
	public function return()
	{
		return $this->_cli--;
	}
	public function rewind()
	{
		return $this->_cli=0;
	}
	public function valid()
	{
		return isset($this->_client[$this->_cli]);
    }
    public function __construct($db)
	{
		$this->setDB($db); // on passe par un setter 
		$this->_client = $this->getList();
	}
     //insertion dans la base de donnée
    public function add(Client $client)
        {
                    $q = $this->_db->prepare('INSERT INTO client(Prenom_client,Nom_client,Mail_client,Adresse_client,PWD_client) VALUES(:Prenom_client, :Nom_client, :Mail_client, :Adresse_client, :PWD_client)');	
                    $q->bindValue(':Prenom_client', $client->getPrenom_client());
                    $q->bindValue(':Nom_client', $client->getNom_client());
                    $q->bindValue(':Mail_client', $client->getMail_client());
                    $q->bindValue(':Adresse_client', $client->getAdresse_client());
                    $q->bindValue(':PWD_client', $client->getPWD_client());
                    $q->execute();
        }
    public function getList()
        {
            // Retourne tous les clients 
            $clients = [];
            $q = $this->_db->query('SELECT id_client,Prenom_client,Nom_client,Mail_client,Adresse_client,PWD_client FROM client ORDER BY Nom_client');
            while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
            {
                $clients[] = new Client($donnees);
            }
            return $clients; // On retourne un tableau d'objets client
        }
    
    public function getInscription($MailC)
	    {
		$MailC = (string) $MailC;
		$q = $this->_db->query("SELECT * FROM client Where Mail_client ='$MailC'");
        $donnees = $q->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                return True;
            }else{
                return False;
            }
		// On retourne un objet de type client
		
        }
        //Observe qui se connecte
        public function getConnextion($Mail,$pwd)
	    {
        if($Mail!="vianney.lautru5@orange.fr"){
        $Mail = (string) $Mail;
        $pwd = (string) $pwd;
		$client = $this->_db->query("SELECT * FROM client Where Mail_client ='$Mail' and PWD_client='$pwd'");
        $donnees = $client->fetch(PDO::FETCH_ASSOC);
            if($donnees){
                if(isset($_SESSION)) 
                { 
                    session_destroy();
                }
                session_start();
                
                $_SESSION['id'] =$donnees['id_client'];
                $_SESSION['Nom'] =$donnees['Nom_client'];
                $_SESSION['Prenom'] =$donnees['Prenom_client'];
                $_SESSION['Mail'] = $donnees['Mail_client'];
                $_SESSION['Adresse'] = $donnees['Adresse_client'];
                $_SESSION['tel'] = $donnees['Adresse_client'];
                $_SESSION['CLIENT']='';
                $_SESSION['CONNECTER']='';
                echo '<script language="Javascript">
                document.location.replace("index.php");
                </script>'; 
                return True;
            }else{
                return False;
            }
		// On retourne un objet de type client
		
        }
    }
    //Vérifie si c'est l'admin qui ce connecte
        public function getConnextionAdmin($Mail,$pwd)
	    {
            $Mail = (string) $Mail;
            $pwd = (string) $pwd;
            if($Mail=="vianney.lautru5@orange.fr"){
                $admin = $this->_db->query("SELECT * FROM client Where Mail_client ='$Mail' and PWD_client='$pwd'");
                $donnees = $admin->fetch(PDO::FETCH_ASSOC);
                    if($donnees){
                        if(isset($_SESSION)) 
                        { 
                            session_destroy();
                        }
                        session_start();
                        $_SESSION['id'] =$donnees['id_client'];
                        $_SESSION['Nom'] =$donnees['Nom_client'];
                        $_SESSION['Prenom'] =$donnees['Prenom_client'];
                        $_SESSION['Mail'] = $donnees['Mail_client'];
                        $_SESSION['Adresse'] = $donnees['Adresse_client'];
                        $_SESSION['ADMIN']='';
                        $_SESSION['CONNECTER']='';
                        echo '<script language="Javascript">
                        document.location.replace("index.php");
                        </script>'; 
                        return True;
                    }else{
                        return False;
                    }
		// On retourne un objet de type client
            }
        }


        
    public function setDb(PDO $db)
        {
            $this->_db = $db;
        }
        
}
?>