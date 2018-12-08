function join(lst) {
    // res = [];
    // res = res.concat(lst);
    res = lst.reduce((phrase, subList) =>{
        return phrase+subList;
    },"");
    return res;
    // lst.reduce((res,lst) =>{
    //     res.push(lst);
    // });
}

// a = ["Happy"," ","holidays"];
// console.log(join(a));

function flatten(arr) {
  return arr.reduce(function (flat, toFlatten) {
    return flat.concat(Array.isArray(toFlatten) ? flatten(toFlatten) : toFlatten);
  }, []);
}

// console.log(flatten([[1, 2, 3], [4, 5]])); // [1, 2, 3, 4, 5]
// console.log(flatten([[[1, [1.1]], 2, 3], [4, 5]])); // [1, 1.1, 2, 3, 4, 5])

// const data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];

// const flat = data.reduce((total, amount) => {
//   return total.concat(amount);
// }, []);

// flat // [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]

exports.join = join;