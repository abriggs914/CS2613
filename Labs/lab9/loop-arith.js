function plus(a,b) {
    for (var i=0; i < a; i++){
        b++;
    }
    if(a < 0){
        b = a + b;
    }
    return b;
}

function mult(a,b) {
    let sum=0;
    for(var x = 0; x < b; x++){
        sum = plus(sum, a);
    }
    return sum;
}

function plus1(a,b) {
    if (a === 0) {
        return b;
    } else {
        return plus(a-1, b+1);
    }
}

function mult2(a,b) {
    if (a===0) {
        return 0;
    } else {
        return plus1(mult2(a-1, b), b);
    }
}

console.log("2*2: " + mult(2, 2));
console.log("2*3: " + mult(2, 3));
console.log("-2*3: " + mult(-2, 3));
console.log("-1000000 + 1000000: " + plus(-1000000, 1000001));
console.log("500*500: " + mult(500, 500));
console.log("2*3: " + mult2(2, 3));

exports.plus = plus;
exports.mult = mult;
exports.plus1 = plus1;
exports.mult2 = mult2;