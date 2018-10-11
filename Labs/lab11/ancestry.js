let read_json_file=require("./read_json_file.js").read_json_file;

let data = null;

function by_name(name){
    if (data===null)
        //data=read_json_file("ancestry.json"); //for ancestry.spec.js tests
        data=read_json_file("big.json"); //for shuffle tests
    // simple linear scan
    for(let i = 0; i < data.length; i++){
        if(data[i].name === name){
            return data[i]; // return data if found
        }
    }
    return null;

}
exports.by_name=by_name;