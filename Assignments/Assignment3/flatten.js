/*function flatten(array){
    //return (array.reduce(function(acc, element) {return acc.concat(element);}, []).split(","));
    return [].concat.apply([], array);
}*/
function flatten(array){
    return array.reduce(function (flat, rst){ // flat is accumulating
      return flat.concat(Array.isArray(rst)? flatten(rst) : rst); // return lst if no
    }, []);                                                        //nested arrays left
  }

exports.flatten = flatten;

console.log("flatten([]): " + flatten([]));
console.log("flatten([1]): " + flatten([1]));
console.log("flatten([[1],2,[3],4,[5,6]]): " + flatten([[1],2,[3],4,[5,6]]));
console.log("flatten([[[1],2,[3]],4,[5,6]]): " + flatten([[[1],2,[3]],4,[5,6]]));