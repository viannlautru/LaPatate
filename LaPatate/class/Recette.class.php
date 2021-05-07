<?php
// Classe qui gère la fabrication d'un objet Client
// Et gère les caractéristiques de cet objet (attributs & méthodes)
// Un classe = un rôle

class Recette
{
    // Atrributs d'un Client
    private $_Id_recette;
	private $_Nom_recette;
	private $_Duree;
	private $_ingredient;
	private $_Categorie;
	private $_image_recette;
	private $_Etape;
	private $_Validation;
	private $_Date;

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
    public function getId_recette()
	{
		return $this->_Id_recette;
	}
	public function getNom_recette()
	{
		return $this->_Nom_recette;
	}
	public function getDuree()
	{
		return $this->_Duree;
	}
	public function getingredient()
	{
		return $this->_ingredient;
	}
	public function getCategorie()
	{
		return $this->_Categorie;
	}
	public function getimage_recette()
	{
		return $this->_image_recette;
	}
	public function getEtape()
	{
		return $this->_Etape;
	}
	public function getValidation()
	{
		return $this->_Validation;
	}
	public function getDate()
	{
		return $this->_Date;
	}
	


    // Les setters ou mutateurs avec éventuellement des restrictions
    public function setId_recette($Id_recette)
	{
		$Id_recette = (int) $Id_recette;
		if ($Id_recette)
		{
			$this->_Id_recette = $Id_recette;
		}
	}
	public function setNom_recette($Nom_recette)
	{
		if (is_string($Nom_recette))
		{
			$this->_Nom_recette = $Nom_recette;
		}
	}

	public function setDuree($Duree)
	{
		$Duree = (int) $Duree;
		if ($Duree)
		{
			$this->_Duree = $Duree;
		}
	}

	public function setingredient($ingredient)
	{

		if (is_string($ingredient))
		{
			$this->_ingredient = $ingredient;
		}
	}
	public function setCategorie($Categorie)
	{
		$Categorie = (int) $Categorie;
		if ($Categorie)
		{
			$this->_Categorie = $Categorie;
		}
	}
	public function setimage_recette($image_recette)
	{
		if (is_string($image_recette))
		{
			$this->_image_recette = $image_recette;
		}
	}
	public function setEtape($Etape)
	{
		if (is_string($Etape))
		{
			$this->_Etape = $Etape;
		}
	}
	public function setValidation($Validation)
	{
		if (is_string($Validation))
		{
			$this->_Validation = $Validation;
		}
	}
	public function setDate($Date)
	{
		if (is_string($Date))
		{
			$this->_Date = $Date;
		}
	}

}