// 1. Combien y a-t-il d'éléments <p> présents dans la page HTML ? Imprime-le résultat dans la console.
console.log("Nombre de balises <p></p> dans le document : " + document.getElementsByTagName("p").length);

// 2. Quel est le contenu texte de l'élément portant l'id coucou ? Imprime-le dans la console.
console.log("le contenu texte de l'élément avec l'id coucou est : " + document.getElementById("coucou").textContent);

// 3. Quelle est l'URL vers laquelle pointe le 3ème élément <a> de la page HTML ? Imprime-la dans la console.
console.log("URL vers laquelle pointe le 3ème élément <a> de la page HTML : " + document.getElementsByTagName('a')[2].href);

// 4. Combien d'éléments portent la classe compte-moi ? Imprime le résultat dans la console.
console.log("il y a " + document.getElementsByClassName("compte-moi").length + " éléments qui portent la classe compte-moi.");

// 5. Combien d'éléments <li> portent la classe compte-moi ? Imprime le résultat dans la console.
console.log("il y a " + document.querySelectorAll("li.compte-moi").length + " éléments <li> qui portent la classe compte-moi");

// 6. Combien d'éléments <li> et situés dans une liste ordonnée portent la classe compte-moi ? Imprime le résultat dans la console.
console.log("il y a " + document.querySelectorAll("ol > li.compte-moi").length + " éléments <li> situés dans une liste ordonnée qui portent la classe compte-moi");

// 7. La page contient un seul élément <div>. Celui-ci contient 2 éléments "unordered list" ou <ul>.
// Dans le second <ul>, le premier élément de la liste (tag <li>) est caché visuellement de l'utilisateur
// mais toi, tu peux en récupérer le contenu. Affiche-le dans la console.
console.log(document.querySelector('div').getElementsByTagName('ul')[1].getElementsByTagName('li')[0].textContent);
