function brag(name,...args){ //any number of parameters as args
    console.log(name + " has");
    for (let i=0; i<args.length; i++) {
        console.log("\t"+args[i]);
    }
}

function win(person,thing="a brick"){
    console.log(person + " won " + thing);
}

console.log(brag("mary")); //undefined
console.log(brag("mary", "bob", "hello", "world")); //undefined
console.log(win("mary", "bob")); //mary won bob
console.log(win("mary", "$100")); //mary won $100
