function convertArnToAcideAmines(arn) {
  // Split arn into chunks of 3 "codons"
  let codons = arn.match(/.{1,3}/g);

  // Convert "codon"'s array into an array of "acide aminés"
  let acides_amines = []

  let combinations = {
    'UCU': 'Sérine', 'UCC': 'Sérine', 'UCA': 'Sérine', 'AGU': 'Sérine', 'AGC': 'Sérine',
    'CCU': 'Proline', 'CCC': 'Proline', 'CCA': 'Proline', 'CCG': 'Proline',
    'UUU': 'Phénylalanine', 'UUC': 'Phénylalanine',
    'CGU': 'Arginine', 'CGC': 'Arginine', 'CGA': 'Arginine', 'CGG': 'Arginine', 'AGA': 'Arginine', 'AGG': 'Arginine',
    'UAU': 'Tyrosine', 'UAC': 'Tyrosine',
  }

  for(let codon in codons) {
    for (let combination in combinations) {
      if (codons[codon] === combination) {
        acides_amines.push(combinations[combination]);
      }
    }
  }

  return acides_amines.join("-")
}

// Launch program
console.log(convertArnToAcideAmines("CCGUCGUUGCGCUACAGC"));
console.log(convertArnToAcideAmines("CCUCGCCGGUACUUCUCG"));
