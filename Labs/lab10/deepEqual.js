/*function deepEqual(obj1, obj2){ // my first attempt non-recursive
    if(obj1 == obj2){
        return true;
    }
    else if(obj1 === obj2){
        return true;
    }
    else if(typeof(obj1) === "object" && typeof(obj2) === "object"){
        //console.log("object handling");
        if(obj1[key] != obj2[key]){
            return false;
        }
        return true;
    }
    return false;
}*/

function deepEqual(a, b){
    if(a === null && b === null){
        return true;
    }
    if(typeof(a) === "object" && typeof(b) === "object"){
        for (key in a){
            if(!(key in b) || !deepEqual(a[key], b[key])){
                return false;
            }

        }
        return true;
    }
    else{
        return (a === b);
    }
}

exports.deepEqual = deepEqual;