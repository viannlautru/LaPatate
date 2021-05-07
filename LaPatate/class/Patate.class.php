<?php
// Classe qui gère la fabrication d'un objet Client
// Et gère les caractéristiques de cet objet (attributs & méthodes)
// Un classe = un rôle

class Patate
{
	// Atrributs d'un Client
	private $_Num_patate;
    private $_Nom_patate;
	private $_Origine_patate;
	private $_Couleur_patate;
    private $_Prix_patate;
    private $_Image_patate;
    private $_Texte_patate;
	private $_Quantite;
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
    public function getNum_patate()
	{
		return $this->_Num_patate;
	}
	public function getNom_patate()
	{
		return $this->_Nom_patate;
	}
	public function getOrigine_patate()
	{
		return $this->_Origine_patate;
	}
	public function getCouleur_patate()
	{
		return $this->_Couleur_patate;
    }
    public function getPrix_patate()
	{
		return $this->_Prix_patate;
    }
    public function getImage_patate()
	{
		return $this->_Image_patate;
    }
    public function getTexte_patate()
	{
		return $this->_Texte_patate;
	}
	public function getQuantite()
	{
		return $this->_Quantite;
	}

    // Les setters 
    public function setNum_patate($Num_patate)
	{
		$Num_patate = (int) $Num_patate;
		if (is_int($Num_patate))
		{
			$this->_Num_patate = $Num_patate;
		}
	}
	public function setNom_patate($Nom_patate)
	{
		if (is_string($Nom_patate))
		{
			$this->_Nom_patate = $Nom_patate;
		}
	}

	public function setOrigine_patate($Origine_patate)
	{
		if (is_string($Origine_patate))
		{
			$this->_Origine_patate = $Origine_patate;
		}
	}

	public function setCouleur_patate($Couleur_patate)
	{
		if (is_string($Couleur_patate))
		{
			$this->_Couleur_patate = $Couleur_patate;
		}
    }

	public function setPrix_patate($Prix_patate)
	{
		$Prix_patate = (float) $Prix_patate;
		if ($Prix_patate)
		{
			$this->_Prix_patate = $Prix_patate;
		}
    }
    public function setImage_patate($Image_patate)
	{
		if (is_string($Image_patate))
		{
			$this->_Image_patate = $Image_patate;
		}
    }
    public function setTexte_patate($Texte_patate)
	{
		if (is_string($Texte_patate))
		{
			$this->_Texte_patate = $Texte_patate;
		}
	}
	public function setQuantite($Quantite)
	{
		if (is_string($Quantite))
		{
			$this->_Quantite = $Quantite;
		}
	}
}