<?php
// Classe qui gère la fabrication d'un objet Client
// Et gère les caractéristiques de cet objet (attributs & méthodes)
// Un classe = un rôle

class Client
{
    // Atrributs d'un Client
    private $_id_client;
	private $_Prenom_client;
	private $_Nom_client;
	private $_Mail_client;
    private $_Adresse_client;
    private $_PWD_client;
	// Le constructeur
	public function __construct(array $donnees)
	{
		// Le constructeur appelle la méthode hydrate
		// Celle ci sera utile pour la construction des objets 
		$this->hydrate($donnees);
	}


	public function hydrate(array $donnees)
	{
		// L'hydratation se fait toujours via les mutateurs
		foreach ($donnees as $key => $value) {
			$method = 'set'.$key;
			if (method_exists($this, $method))
			{
				$this->$method($value);
			}
		
		}
	}



    // Les getters
    public function getid_client()
	{
		return $this->_id_client;
	}
	public function getPrenom_client()
	{
		return $this->_Prenom_client;
	}
	public function getNom_client()
	{
		return $this->_Nom_client;
	}
	public function getMail_client()
	{
		return $this->_Mail_client;
	}
	public function getAdresse_client()
	{
		return $this->_Adresse_client;
    }
    public function getPWD_client()
	{
		return $this->_PWD_client;
	}

    // Les setters ou mutateurs avec éventuellement des restrictions
    public function setid_client($id_client)
	{
		if (is_int($id_client))
		{
			$this->_id_client = $id_client;
		}
	}
	public function setPrenom_client($Prenom_client)
	{
		if (is_string($Prenom_client))
		{
			$this->_Prenom_client = $Prenom_client;
		}
	}

	public function setNom_client($Nom_client)
	{
		if (is_string($Nom_client))
		{
			$this->_Nom_client = $Nom_client;
		}
	}

	public function setMail_client($Mail_client)
	{
		if (is_string($Mail_client))
		{
			$this->_Mail_client = $Mail_client;
		}
	}

	public function setAdresse_client($Adresse_client)
	{
		if (is_string($Adresse_client))
		{
			$this->_Adresse_client = $Adresse_client;
		}
    }
    public function setPWD_client($PWD_client)
	{
		if (is_string($PWD_client))
		{
			$this->_PWD_client = $PWD_client;
		}
	}
}