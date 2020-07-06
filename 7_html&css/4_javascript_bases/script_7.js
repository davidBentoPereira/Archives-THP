question = window.prompt("Quelle est ta question jaune padawan ?")

if (question.toLocaleLowerCase().includes("fortnite")) {
  console.log("on s'fait une partie soum-soum ?")
} else if (question.endsWith("?")) {
  console.log("Ouais Ouais...")
} else if (question === "") {
  console.log("t'es en PLS ?")
} else if (question === question.toUpperCase()) {
  console.log("Pwa, calmes-toi...")
} else {
  console.log("balek.")
}
