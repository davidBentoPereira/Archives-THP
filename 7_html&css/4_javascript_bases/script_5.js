const books = [
  { title: 'Gatsby le magnifique', id: 133712, rented: 39 },
  { title: 'A la recherche du temps,perdu', id: 237634, rented: 28 },
  { title: 'Orgueil & Préjugés', id: 873495, rented: 67 },
  { title: 'Les frères Karamazov', id: 450911, rented: 55 },
  { title: 'Dans les forêts de Sibérie', id: 8376365, rented: 15 },
  { title: 'Pourquoi j\'ai mangé mon père', id: 450911, rented: 45 },
  { title: 'Et on tuera tous les affreux', id: 67565, rented: 36 },
  { title: 'Le meilleur des mondes', id: 88847, rented: 58 },
  { title: 'La disparition', id: 364445, rented: 33 },
  { title: 'La lune seule le sait', id: 63541, rented: 43 },
  { title: 'Voyage au centre de la Terre', id: 4656388, rented: 38 },
  { title: 'Guerre et Paix', id: 748147, rented: 19 }
];


// Est-ce que tous les livres ont été au moins empruntés une fois ?
for( let book in books) {
  if (books[book].rented <= 1 ) {
    console.log("Non, il y a au moins un livre qui n'a pas été emprunté une fois.");
  } else {
    console.log("Tous les livres ont déjà été empruntés au moins une fois.");
  }
}

// Quel est livre le plus emprunté ?
mostRentedBookTitle = '';
mostRentedBookValue = 0;

for( let book in books) {
  if (books[book].rented >= mostRentedBookValue ) {
    mostRentedBookTitle = books[book].title;
    mostRentedBookValue = books[book].rented;
  }
}

console.log("Avec un palmarès de " + mostRentedBookValue+ " lectures, le livre le plus lu est : " + mostRentedBookTitle);

// Quel est le livre le moins emprunté ?
lessRentedBookTitle = '';
lessRentedBookValue = mostRentedBookValue;

for( let book in books) {
  if (books[book].rented <= lessRentedBookValue ) {
    lessRentedBookTitle = books[book].title;
    lessRentedBookValue = books[book].rented;
  }
}

console.log("Avec un palmarès de " + lessRentedBookValue+ " lectures, le livre le plus lu est : " + lessRentedBookTitle);

// Trouve le livre avec l'ID: 873495 ;
for( let book in books) {
  if (books[book].id === 873495 ) {
    console.log("Le livre avec l'ID 873495 est : " + books[book].title);
  }
}

// Supprime le livre avec l'ID: 133712 ;
console.log("Le livre avec l'ID: 133712 a bien été supprimé");
books.splice(books.findIndex(book => book.id == 133712), 1);


// Trie les livres par ordre alphabétique (sans celui avec l'ID 133712 car il est supprimé).
books.sort(function(a, b){
  if(a.title < b.title) { return -1; }
  if(a.title > b.title) { return 1; }
  return 0;
})

for( let book in books) {
  console.log(books[book].title);
}
