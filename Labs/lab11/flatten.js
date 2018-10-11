function flatten(array){
    return array.reduce(function(acc,element) {return acc.concat(element);}, []);
}/*
function flatten (array){
    return array.join(","); 
}*/

exports.flatten = flatten;

console.log("flatten([]): " + flatten([]));
console.log("flatten([1]): " + flatten([1]));
console.log("flatten([[1],2,[3],4,[5,6]]): " + flatten([[1],2,[3],4,[5,6]]));
console.log("flatten[[[1],2,[3]],4,[5,6]]: " + [[[1],2,[3]],4,[5,6]]);