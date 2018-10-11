let read_json_file=require("./read_json_file.js").read_json_file;

let cache = {};
let data = null;

function by_name(name){
    if (data===null)
        data=read_json_file("big.json");
    if (cache[name] != undefined)
        return cache[name];
    // loop goes here
    for(let i = 0; i < data.length; i++){
        if(data[i].name === name){
            return data[i]; // return data if found
        }
    }   

    return null;
};

exports.by_name=by_name;