function range(start, end, step){
    let nums = [];
    if(step === 0){
        return [];
    }
    if(step > 0){
        for(let i = start; i <= end; i+=step){
            nums.push(i);
        }
    }
    else{
        for(let i = start; i >= end; i+=step){
            nums.push(i);
        }
    }
    return nums;
}

function sum(lst){
    let sum = 0;
    for(let i = 0; i < lst.length; i++){
        sum += lst[i];
    }
    return sum;
}

console.log(range(1, 10, 2));
console.log(sum(range(1, 10, 2)));

exports.range = range;
exports.sum = sum;