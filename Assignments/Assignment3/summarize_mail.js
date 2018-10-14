//let fs = require('fs');
let read_json_file = require("./read_json_file.js").read_json_file;
let flatten = require("./flatten.js").flatten;
let data = null;

function summarize_mail(filename, categories){
if (data===null)
    //data=read_json_file("ancestry.json"); //for ancestry.spec.js tests
    data=read_json_file(filename); //for shuffle tests
// simple linear scan
for(let i = 0; i < data.length; i++){
    if(data[i].name === categories){
        return data[i]; // return data if found
    }
}
return null;
    //read_json_file("example1.json");
}
exports.summarize_mail = summarize_mail;
console.log(flatten(summarize_mail("example1.json")));
console.log("\n\n\n\n\n\n\n");
console.log(summarize_mail("example1.json", "Subject", "Date"));
//exports.read_json_file=read_json_file;