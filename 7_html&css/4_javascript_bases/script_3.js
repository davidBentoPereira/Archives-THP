console.log("Salut, bienvenue dans ma super pyramide !");
floor = window.prompt("Combien d'étages veux-tu ?")

current_floor = 0
i = 0;

while (i <= floor) {
  console.log(' '.repeat(floor) + '#'.repeat(current_floor));
  floor = floor - 1
  current_floor = current_floor + 1
}
