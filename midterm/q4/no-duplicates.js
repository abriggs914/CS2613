// CS2613 midterm exam q4
// Oct. 25 2018
// Avery Briggs
// 3471065
// The way I implemented this function, there are not any possible duplicates
// that could be added in the merge

function no_dups(obj1, obj2){
    var res = {};
    if(obj1 === null && obj2 === null){ // both are null
        return null;
    }
    if(obj1 === undefined){ // one is null
        if(obj2 !== undefined){
            return obj2; //obj1 is null
        }
        else{
            return null;
        }
    }
    if(typeof(obj1) === "object" && typeof(obj2) === "object"){
        //console.log("obj1.id " + obj1.id + "\tobj2.id " + obj2.id);
        if(obj1.id === obj2.id && typeof(obj1.id) === "number"){
            for(var key in obj1){ // loop through and add obj1's porperties, making sure for no duplicates
                if(key !== undefined){
                    res[key] = obj1[key];
                }
                else{
                    res[key] = obj2[key];
                }    
            }
            for(var key in obj2){ // loop through and add obj2's porperties, making sure for no duplicates
                if(key !== undefined){
                    res[key] = obj2[key];
                }
                else{
                    res[key] = obj1[key];
                }    
            }
            //console.log("merged");
            return res;
        }
        else{
            //console.log("obj1 != obj2");
            return null;
        }
    }
    return null;
    
}
/*      Tests
console.log("FIRST: " + no_dups({},{}));
console.log("second: " + no_dups(no_dups({id:0, name:"bob"}, {id:1, occupation: "builder"})));
console.log("third: " + no_dups({id:0, name:"bob"}, {id:0, occupation: "builder"}));
*/
exports.no_dups = no_dups;