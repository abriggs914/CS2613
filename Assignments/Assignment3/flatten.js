// Function simply takes in a list of stuff
// and returns a "flattened" copy of the list
// with all nested lists broken up.
function flatten(arr){
    return arr.reduce(function (acc, rst) {
        return acc.concat(((Array.isArray(rst))? flatten(rst) : rst));
    }
        , []);
}

exports.flatten = flatten;

/*      Tests
console.log("flatten([]): " + flatten([]));
console.log("flatten([1]): " + flatten([1]));
console.log("flatten([[1],2,[3],4,[5,6]]): " + flatten([[1],2,[3],4,[5,6]]));
console.log("flatten([[[1],2,[3]],4,[5,6]]): " + flatten([[[1],2,[3]],4,[5,6]]));
*/