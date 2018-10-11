function average (array) {
    return array.reduce(function (a,b) {return a+b;}, 0)/array.length; //similar to foldl
}
console.log("average: ");
console.log("[1,2,3]: " + average([1,2,3]));
console.log("[2,3,4,5]: " + average([2,3,4,5]));


function average2 (array) { // similar to map
    let sum=0;
    array.forEach(function (a) {sum += a;}); // similar to a lambda expression in racket
    return sum/array.length;
}
console.log("\naverage2: ");
console.log("[1,2,3]: " + average2([1,2,3]));
console.log("[2,3,4,5]: " + average2([2,3,4,5]));