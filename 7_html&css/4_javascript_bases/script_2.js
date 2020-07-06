input = window.prompt("De quel nombre veux-tu calculer la factorielle ?");


let f = [];
function factorial (n) {
    if (n == 0 || n == 1)
        return 1;
    if (f[n] > 0)
        return f[n];
    return f[n] = factorial(n-1) * n;
}


result =factorial(input)

console.log("Le résultat est : " + result);
alert("Le résultat est : " + result);
