<?php
// Classe qui gère la fabrication d'un objet Client
// Et gère les caractéristiques de cet objet (attributs & méthodes)
// Un classe = un rôle

class Article 
{
	// Atrributs d'un Client
	private $_Num_article;
    private $_Nom_article;
    private $_Prix_article;
	private $_Quantite_article;
	private $_Panier_article;


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
    public function getNum_article()
	{
		return $this->_Num_article;
	}
	public function getNom_article()
	{
		return $this->_Nom_article;
	}
	public function getPrix_article()
	{
		return $this->_Prix_article;
	}
   public function getQuantite_article()
	{
		return $this->_Quantite_article;
    }
	public function getPanier_article()
	{
		return $this->_Panier_article;
    }
    // Les setters ou mutateurs avec éventuellement des restrictions
    public function setNum_article($Num_article)
	{
		if (is_int($Num_article))
		{
			$this->_Num_article = $Num_article;
		}
	}
	public function setNom_article($Nom_article)
	{
		if (is_string($Nom_article))
		{
			$this->_Nom_article = $Nom_article;
		}
	}

	public function setPrix_article($Prix_article)
	{
		$Prix_article = (float) $Prix_article;
		if ($Prix_article)
		{	
			$this->_Prix_article = $Prix_article;
		}
	}
	public function setQuantite_article($Quantite_article)
	{
		$Quantite_article = (int) $Quantite_article;
		if ($Quantite_article)
		{	
			$this->_Quantite_article = $Quantite_article;
		}
    }
	public function setPanier_article($Panier_article)
	{
		$Panier_article = (int) $Panier_article;
		if ($Panier_article)
		{
			
			$this->_Panier_article = $Panier_article;
		}
    }

}