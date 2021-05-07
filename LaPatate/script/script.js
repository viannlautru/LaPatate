
function responcive() {
  var x = document.getElementById("myTopnav");
  if (x.className == "topnav" ) {
    if(screen.width<1300){
     x.className = 'bar';
     x.className += " responsive";
    }else{
      x.className = 'topnav';
    }
  } else {
    x.className = "topnav";
  }
}
function afficher_cacher(id)
{
    
    if(document.getElementById(id).style.visibility=="hidden")
    {
        
        document.getElementById('stock').style.visibility="hidden";
        document.getElementById('recette').style.visibility="hidden";
        document.getElementById('ajout').style.visibility="hidden";
        document.getElementById('commande').style.visibility="hidden";
        document.getElementById(id).style.visibility="visible";
        document.cookie ='nom_cookie='+id+';path=chemin;';
    }
    else
    {
        document.getElementById(id).style.visibility="hidden";
    }
    return true;
}

n=0;
function creer()
{
var input = document.createElement("input");

 n+=1;
input.type="text";
 
document.body.appendChild(input);
   // Créer un input
   var newInput=document.createElement('input');
   var newQuant=document.createElement('input');
   var newUnite=document.createElement('input');
 
  // De type texte
   newInput.type='text';   
   newQuant.type='number';
   newUnite.type='text';
  // avec un identifiant
   newInput.id='newId';
   newInput.placeholder='Ingredient';
   newQuant.id='newQuant';
   newQuant.placeholder='Quantité';
   newUnite.id='newUnite';
   newUnite.placeholder='Unité de mesure';
   newInput.name='ingredient'+n;
   newQuant.name='quant'+n;
   newUnite.name='unite'+n;
  // Capturer le container (élément du DOM)
   var monCnt=document.getElementById('cnt');
  // Pour effectuer l'insertion (d'un noeud enfant à la fin du contenu)
  monCnt.append(n);
   monCnt.appendChild(newInput);
   monCnt.appendChild(newQuant);
   monCnt.appendChild(newUnite);
}
function ajoutetape()
{
var textarea = document.createElement("textarea");
textarea.type="text";
 n+=1;

 
document.body.appendChild(textarea);
   // Créer un textarea
   var newtextarea=document.createElement('textarea');

  // De type texte
   newtextarea.type='text';   
  // avec un identifiant
   newtextarea.id='idetape';
   newtextarea.name='Etape'+n;

  // Capturer le container (élément du DOM)
   var monetape=document.getElementById('etape');
  // Pour effectuer l'insertion (d'un noeud enfant à la fin du contenu)
  monetape.append(' '+n+'-');
   monetape.appendChild(newtextarea);
}

function handleFileSelect(evt) {
  var files = evt.target.files;

  // Loop through the FileList and render image files as thumbnails.
  for (var i = 0, f; f = files[i]; i++) {

    // Only process image files.
    if (!f.type.match('image.*')) {
      continue;
    }

    var reader = new FileReader();

    // Closure to capture the file information.
    reader.onload = (function(theFile) {
      return function(e) {
        // Render thumbnail.
        var span = document.createElement('span');
        span.innerHTML = 
        [
          '<img style="width: 100%; border: 1px solid #000; margin: 5px" src="', 
          e.target.result,
          '" title="', escape(theFile.name), 
          '"/>'
        ].join('');
        
        document.getElementById('list').insertBefore(span, null);
      };
    })(f);

    // Read in the image file as a data URL.
    reader.readAsDataURL(f);
  }
}