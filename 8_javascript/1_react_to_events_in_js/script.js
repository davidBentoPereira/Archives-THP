/*
* Fonctionnalité 1 : On commence par un petit échauffement : lorsque l'utilisateur va cliquer sur le footer (portant le tag <footer>), tu vas afficher le mot "clique" en console.
* Cette fonctionnalité doit être codée avec un addEventListener("click", function(){ } car c'est une bonne habitude à prendre ! 😇
*/
let footerElmt = document.querySelector('footer');
footerElmt.addEventListener('click', function() {
  console.log('clique');
});

/*
* Fonctionnalité 1-bis :
* Maintenant on va upgrader cette première fonctionnalité : lorsque l'utilisateur va cliquer sur le footer, tu vas afficher en console "clic numéro x"
* avec x qui commence à 1 et s'incrémente de +1 à chaque clic.
*/
let count = 1;
footerElmt.addEventListener('click', function() {
  console.log('clic numéro #' + count);
  count += 1;
});

/*
* Fonctionnalité 2 :
* On va enfin faire fonctionner ce satané "Hamburger Menu" qui s'affiche depuis le début mais qui n'actionne rien quand on clique dessus.
* C'est quoi un "hamburger menu" ? C'est ça, ce bouton avec trois lignes horizontales en haut à droite de la navbar.
* Tu vas faire que si quelqu'un clique sur ce bouton, l'élément HTML portant l'Id navbarHeader perde sa classe collapse.
* Une fois que ça, ça marche, fait que si on clique à nouveau dessus, la classe collapse soit rajoutée à nouveau à l'élément portant l'Id navbarHeader.
*/
let navbarHeaderElmt = document.getElementById('navbarHeader');
let collapsed = true;

navbarHeaderElmt.addEventListener('click', function() {
  if (collapsed === true) {
    navbarHeaderElmt.classList.remove('collapse');
    collapsed = false
  } else {
    navbarHeaderElmt.classList.add('collapse');
    collapsed = true
  }
});

/*
* Fonctionnalité 3 :
* À présent, on va faire cela : si on clique sur le bouton "Edit" de la première card, le texte de la card va se mettre en rouge de façon
* irréversible (sauf si on recharge la page). À toi de jouer !
*/
let btnEditElmt = document.querySelectorAll('.btn.btn-sm.btn-outline-secondary')[0];

btnEditElmt.addEventListener('click', function() {
  btnEditElmt.style.color = 'red';
});

/*
* Fonctionnalité 4 :
* On va faire quelque chose de similaire à la fonctionnalité 3 mais un peu plus complexe : si on clique sur le bouton "Edit" de la deuxième card,
* le texte de la card va se mettre en vert. Si on re-clique dessus, il redevient comme avant ! Tu l'as compris, il va falloir que tu cherches
* comment faire un "toggle" sur le style du texte. C'est plus compliqué que sur une classe.
*/
let btnEdit2Elmt = document.querySelectorAll('.btn.btn-sm.btn-outline-secondary')[1];
btnEdit2Elmt.style.color = 'grey';

btnEdit2Elmt.addEventListener('click', function() {
  if (btnEdit2Elmt.style.color === 'grey') {
    btnEdit2Elmt.style.color = 'green';
  } else {
    btnEdit2Elmt.style.color = 'grey';
  }
});

/*
* Fonctionnalité 5 :
* Pour le fun, on va implémenter une fonctionnalité à la sauce ☢"nucléaire"🤯. Et comme elle est un peu dangereuse, on va la cacher…
* Voici comment elle doit marcher : si un utilisateur double clique sur la navbar en haut, tout Bootstrap disparaît et la page
* s'affiche comme si on avait oublié de mettre le CDN qui la relie au fichier CSS. Si possible, rends cette fonctionnalité
* réversible (un nouveau double-clic fait tout revenir à la normale).
*/
document.querySelector("header").addEventListener("dblclick", function(){
  if (document.querySelector("link").disabled === false) {
    document.querySelector("link").disabled = true ;
  } else {
    document.querySelector("link").disabled = false ;
  }
});

/*
* Fonctionnalité 6 :
* T'as déjà implémenté 5 fonctionnalités d'interaction ! C'est top ! On va commencer à corser les choses.
* La fonctionnalité sera la suivante : si un utilisateur passe sa souris sur le bouton "View" d'une card
* (n'importe laquelle), celle-ci va se réduire. Cela veut dire que le texte disparaît, l'image n'apparaîtra
* qu'à 20 % de sa taille d'origine et les boutons "Edit" / "View" restent visibles. Cette fonction sera
* réversible : s'il repasse sa souris, la card redevient normale !
*/
let btnViewElmt = document.querySelectorAll('.btn-success')
let textElmt = document.querySelectorAll('.card-text')
let imgElmt = document.querySelectorAll('.card-img-top')

for (let i = 0; i < btnViewElmt.length; i++) {
  btnViewElmt[i].addEventListener('mouseover', function () {
    if (textElmt[i].style.display !== 'none') {
      imgElmt[i].style.width = '20%'
      textElmt[i].style.display = 'none'
    } else {
      imgElmt[i].style.width = '100%'
      textElmt[i].style.display = ''
    }
  })
}

/*
* Fonctionnalité 7 :
* Allez on va rajouter un peu de WTF dans la page : si un utilisateur clique sur le bouton gris ==>, la dernière card
* (en bas à droite) va passer en premier (en haut à gauche). On va pouvoir faire tourner les cards !
* Petite remarque : tu vas réaliser que si tu mélanges les cards, il est fort probable que la fonctionnalité 6 va se
*  mettre à faire n'importe quoi. Si tu survoles un bouton "View", c'est une autre card qui va se réduire.
*  Si tu arrives à corriger ça, c'est cool mais la consigne est d'ignorer ce souci pour le moment.
*/
let cardGridElemt = document.querySelector('.album > .container > .row');
let btnRightElmt = document.querySelector('.btn.btn-secondary.my-2');

btnRightElmt.addEventListener('click', function (e) {
  e.preventDefault();
  cardGridElemt.insertBefore(cardGridElemt.lastElementChild, cardGridElemt.firstElementChild);
})

/*
* Fonctionnalité 8 :
Évidemment tu t'y attendais : on va faire tourner les card dans l'autre sens aussi. Donc si un utilisateur clique
* sur le bouton bleu <==, la première card devra passer en dernier. À première vue, tu te dis que si tu as réussi
* à faire la fonctionnalité précédente, celle-ci c'est du gateau... sauf qu'il y a quelques pièges.
*/
let btnLeftElmt = document.querySelector('section .btn-primary');

btnLeftElmt.removeAttribute('href');

btnLeftElmt.addEventListener('click', function (event) {
  event.stopPropagation();
  cardGridElemt.insertBefore(cardGridElemt.firstElementChild, cardGridElemt.lastElementChild.nextSibling);
})

/*
* Fonctionnalité 9 :
* Bon si t'es arrivé jusque-là, c'est que t'as besoin d'un peu de challenge.
* Du coup je t'ai concocté une fonctionnalité de derrière les fagots, spécialement conçue
* pour les moussaillons pas piqués des hannetons (this sentence is brought to you by www.vieilles-expressions.fr). Voici ce qu'elle va devoir faire :
*   La fonctionnalité se déclenchera si le logo de la page (JS & Events) est sélectionné et qu'on appuie sur une touche spécifique du clavier.
*   Si l'utilisateur presse la touche "a", l'ensemble de la page va être condensé sur 4 colonnes Bootstrap à gauche de l'écran.
*   Si l'utilisateur presse la touche "y", l'ensemble de la page va être condensé sur 4 colonnes Bootstrap au milieu de l'écran.
*   Si l'utilisateur presse la touche "p", l'ensemble de la page va être condensé sur 4 colonnes Bootstrap à droite de l'écran.
*   Si l'utilisateur presse la touche "b", tout redevient normal.
*/
// https://css-tricks.com/snippets/javascript/javascript-keycodes/
// https://developer.mozilla.org/fr/docs/Web/API/KeyboardEvent
let logoElmt = document.getElementsByClassName('navbar-brand')[0];

logoElmt.addEventListener('click', function() {
  document.addEventListener('click', function (e){
    if(e.key === 'a') {
      document.body.className = '';
      document.body.classList.add('col-4');
    } else if (e.key ==='y') {
      document.body.className = '';
      document.body.classList.add('offset-4', 'col-4');
    } else if (e.key ==='p') {
      document.body.className = '';
      document.body.classList.add('offset-8', 'col-4');
    } else if (e.key ==='b') {
      document.body.className = '';
    }
  });
})
