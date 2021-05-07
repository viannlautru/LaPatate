<?php
class ArticleManager implements iterator
{
    private $_db;
    // Le seul attribut de cette classe Manager
    private $_art = 0;
    private $_article;
    
    public function current()
	{
		return $this->_article[$this->_art];
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
		return isset($this->_article[$this->_art]);
    }
    public function __construct($db)
	{
		$this->setDB($db); // on passe par un setter 
		$this->_article = $this->getList();
    }
     //insertion dans la base de donnée
    public function addarticle(article $article)
        {          
                        $q = $this->_db->prepare('INSERT INTO articles(Nom_articles,Prix_articles,Quantite_articles,Panier_article) VALUES(:Nom_article, :Prix_article, :Quantite_article, :Panier_article)');	
                        $q->bindValue(':Nom_article', $article->getNom_article());
                        $q->bindValue(':Prix_article', $article->getPrix_article());
                        $q->bindValue(':Quantite_article', $article->getQuantite_article());
                        $q->bindValue(':Panier_article', $article->getPanier_article());
                        $q->execute();
                        
                
        }
        public function getList()
        {
            // Retourne tous les articles 
            $article = [];
            $q = $this->_db->query('SELECT * FROM articles ORDER BY id_articles');
            while ($donnees = $q->fetch(PDO::FETCH_ASSOC))
            {
                $article[] = new Article($donnees);
            }
            return $article; // On retourne un tableau d'objets articles
        }


        public function setDb(PDO $db)
        {
            $this->_db = $db;
        }
    

}
?>