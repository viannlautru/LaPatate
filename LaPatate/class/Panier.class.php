<?php
// Classe qui gère la fabrication d'un objet Client
// Et gère les caractéristiques de cet objet (attributs & méthodes)
// Un classe = un rôle

class Panier
{
	// Atrributs d'un Client
	private $_id_panier;
    private $_Prixtot_panier;
    private $_Date_panier;
	private $_Adresse_panier;
    private $_Nom_panier;
    private $_Prenom_panier;
    private $_Mail_panier;
    private $_Tel_panier;
    private $_nombrearticle_panier;
	private $_Envoyer;

	// Le constructeur
	public function __construct(array $donnees)
	{
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
    public function getid_panier()
	{
		return $this->_id_panier;
	}
    public function getPrixtot_panier()
	{
		return $this->_Prixtot_panier;
	}
	public function getDate_panier()
	{
		return $this->_Date_panier;
	}
    public function getAdresse_panier()
	{
		return $this->_Adresse_panier;
	}
	public function getNom_panier()
	{
		return $this->_Nom_panier;
	}
    public function getPrenom_panier()
	{
		return $this->_Prenom_panier;
	}
    public function getMail_panier()
	{
		return $this->_Mail_panier;
	}
    public function getTel_panier()
	{
		return $this->_Tel_panier;
	}
	
    public function getnombrearticle_panier()
	{
		return $this->_nombrearticle_panier;
	}
	public function getEnvoyer()
	{
		return $this->_Envoyer;
	}
	
    // Les setters ou mutateurs avec éventuellement des restrictions
    public function setid_panier($id_panier)
	{
		$id_panier = (int) $id_panier;
		if ($id_panier)
		{
			$this->_id_panier = $id_panier;
		}
	}
    public function setPrixtot_panier($Prixtot_panier)
	{
		$Prixtot_panier = (float) $Prixtot_panier;
		if ($Prixtot_panier)
		{
			$this->_Prixtot_panier = $Prixtot_panier;
		}
	}
    public function setAdresse_panier($Adresse_panier)
	{
		if (is_string($Adresse_panier))
		{
			$this->_Adresse_panier = $Adresse_panier;
		}
	}
	public function setNom_panier($Nom_panier)
	{
		if (is_string($Nom_panier))
		{
			$this->_Nom_panier = $Nom_panier;
		}
	}
    public function setPrenom_panier($Prenom_panier)
	{
		if (is_string($Prenom_panier))
		{
			$this->_Prenom_panier = $Prenom_panier;
		}
	}
    public function setMail_panier($Mail_panier)
	{
		if (is_string($Mail_panier))
		{
			$this->_Mail_panier = $Mail_panier;
		}
	}
    public function setTel_panier($Tel_panier)
	{	
		$Tel_panier = (int) $Tel_panier;
		if ($Tel_panier)
		{ 	
			$this->_Tel_panier = $Tel_panier;
		}
	}
	public function setnombrearticle_panier($nombrearticle_panier)
	{
		$nombrearticle_panier = (int) $nombrearticle_panier;
		if ($nombrearticle_panier)
		{
			$this->_nombrearticle_panier = $nombrearticle_panier;
		}
    }
	public function setDate_panier($Date_panier)
	{
		if (is_string($Date_panier))
		{
		$this->_Date_panier = $Date_panier;
		}
    }	
	public function setEnvoyer($Envoyer)
	{
		if (is_string($Envoyer))
		{
		$this->_Envoyer = $Envoyer;
		}
    }


}