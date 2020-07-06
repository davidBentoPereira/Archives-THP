// Modif 1 => Écris une fonction changeTitles() qui va :
//
//     Pointer vers le titre en haut de page ("Album Example") et le changer en "Ce que j'ai appris à THP"
// Pointer vers le sous-titre ("Something short and leading about…") et le changer en "THP est une formation qui, en 3 mois, à plein temps, vous apportera des connaissances actionnables pour vous permettre de voir plus loin. Chez nous, pas de professeurs, pas de locaux, mais un groupe de travail en présentiel. Après 11 semaines, les principaux langages et outils du web n'auront plus de secret pour vous !"
function changeTitles() {
  document.getElementsByTagName("h1")[0].textContent = "Ce que j'ai appris à THP";
  document.querySelectorAll("p.lead")[0].textContent = "THP est une formation qui, en 3 mois, à plein temps, vous apportera des connaissances actionnables pour vous permettre de voir plus loin. Chez nous, pas de professeurs, pas de locaux, mais un groupe de travail en présentiel. Après 11 semaines, les principaux langages et outils du web n'auront plus de secret pour vous !";
}
changeTitles()


// Modif 2 => Ecris une fonction changeCallToActions() qui va:
//
//     Changer le texte du bouton "Main call to action" en "OK je veux tester !"
// Ajouter l'URL (un href) vers laquelle le bouton "Main call to action" va pointer : "http://www.thehackingproject.org"
// Changer le texte du bouton "Secondary action" en "Non Merci"
// Ajouter l'URL vers laquelle le bouton "Secondary action" va pointer : "https://www.pole-emploi.fr/accueil/"
function changeCallToActions() {
  document.querySelectorAll("a.btn-primary")[0].textContent = "OK je veux tester !"
  document.querySelectorAll("a.btn-primary")[0].href = "http://www.thehackingproject.org"

  document.querySelectorAll("a.btn-secondary")[0].textContent = "Non Merci"
  document.querySelectorAll("a.btn-secondary")[0].href = "https://www.pole-emploi.fr/accueil/"

}
changeCallToActions()

// Modif 3 => Écris une fonction changeLogoName() qui va modifier le titre "Album" de la navbar (en haut à gauche) de la façon suivante :
//
//     Change "Album" par "The THP Experience" ;
// Change la taille du texte pour le passer en 2em.
function changeLogoName(){
  document.querySelector(".navbar-brand > strong").textContent = "The THP Experience of the Hell";
  document.querySelector(".navbar-brand > strong").style.fontSize = "1.2em";
}
changeLogoName()

// Modif 4 => Écris une fonction populateImages() qui va ajouter, dans chacune des 9 cards, une image dont l'URL est contenue dans l'array suivant :
// let imagesArray = ["https://img.icons8.com/color/480/000000/html-5.png", "https://img.icons8.com/color/480/000000/css3.png", "https://img.icons8.com/color/480/000000/javascript.png", "https://img.icons8.com/color/480/000000/ruby-programming-language.png", "https://img.icons8.com/color/480/000000/bootstrap.png", "https://img.icons8.com/color/480/000000/github.png", "http://jeudisdulibre.be/wp-content/uploads/2014/02/Ruby_on_Rails-logo.png", "https://avatars2.githubusercontent.com/u/25484553?s=200&v=4", "https://img.icons8.com/color/480/000000/heroku.png"];
function populateImages() {
  let array = ["https://img.icons8.com/color/480/000000/html-5.png", "https://img.icons8.com/color/480/000000/css3.png", "https://img.icons8.com/color/480/000000/javascript.png", "https://img.icons8.com/color/480/000000/ruby-programming-language.png", "https://img.icons8.com/color/480/000000/bootstrap.png", "https://img.icons8.com/color/480/000000/github.png", "http://jeudisdulibre.be/wp-content/uploads/2014/02/Ruby_on_Rails-logo.png", "https://avatars2.githubusercontent.com/u/25484553?s=200&v=4", "https://img.icons8.com/color/480/000000/heroku.png"];

  array.forEach((value, index) => {document.querySelectorAll("img.card-img-top")[index].src = value})

}
populateImages()

// Modif 5 => Écris une fonction deleteLastCards() qui va supprimer les 3 dernières cards via une boucle. Je donne ci-dessous 2 coups de main sur cette modification : les plus à l'aise peuvent essayer de ne pas les lire.
function deleteLastCards() {
  for (let i = 1; i < 4; i++) {
    let element = document.getElementsByClassName("card");
    element[element.length - i].style.display = 'none';
  }
}
deleteLastCards();

// Modif 6 => Écris une fonction changeCardsText() qui va modifier le texte des 3 premières cards et le remplacer avec cela :
//
// Carte HTML : "L’HyperText Markup Language, généralement abrégé HTML, est le langage de balisage conçu pour représenter les pages web"
// Carte CSS : "Les feuilles de style en cascade, généralement appelées CSS de l'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML"
// Carte JS : "JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives mais aussi pour les serveurs. C'est un langage orienté objet à prototype."
//
// Essaye de mettre ça dans une boucle.
function changeCardsText() {
  let text = [
      'L’HyperText Markup Language, généralement abrégé HTML, est le langage de balisage conçu pour représenter les pages web',
      'Les feuilles de style en cascade, généralement appelées CSS de l\'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML',
      'JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives mais aussi pour les serveurs. C\'est un langage orienté objet à prototype.'
  ]
  for (let i = 0; i < 3; i++) {
    document.getElementsByClassName("card-text")[i].textContent = text[i];
  }
}
changeCardsText()

// Modif 7 => Écris une fonction changeViewButtons() qui va modifier tous les boutons "View" des cards pour les passer en vert.
// En gros il faut leur mettre la classe btn-success et enlever btn-outline-secondary.
// Les boutons Edit ne doivent pas changer.
// Évite bien sûr de faire les 6 modifications une à une ... faut de la boucle là !
function changeViewButtons() {
  for (let i = 0; i < 11; i++) {
    let element = document.querySelectorAll(".btn-group > button")[i];
    if ( i % 2 === 0 && element.classList.contains("btn-outline-secondary")) {
      element.className = "btn btn-outline-success";
    }
  }
}
changeViewButtons()

// Modif 8 => Allez, on finit sur une modification un peu tordue :
//
// Rajoute une <div> portant la classe row juste après celle qui contient déjà les cards actuelle.
// Déplace la 3ème card (JS) de la première <div class="row"> vers la deuxième que tu viens de créer.
//
// Elle est pas belle cette pyramide inversée en front 👳? (comment ça "obsédés par les pyramides" ?).
function obsessbyPyramids() {
  // Create new row
  let div = document.createElement("div");
  div.className = 'row';

  // Append new div.row element to the row containing all the cards
  document.getElementsByClassName('row')[1].appendChild(div);

  // Add thrid card into the new div
  div.appendChild(document.querySelectorAll('.col-md-4')[2]);

  // Select the div containing all the cards
  let currentDiv = document.querySelectorAll(".row")[1];

  // Magie de kirikou
  document.querySelectorAll(".container")[3].insertBefore(div, currentDiv.nextSibling);
}
obsessbyPyramids()
