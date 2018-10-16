//let fs = require('fs');
let read_json_file = require("./read_json_file.js").read_json_file;
let flatten = require("./flatten.js").flatten;
let data = null;
let lst = null;

function summarize_mail(filename){
  data = null;
  lst = null;
if (data===null)
    //data=read_json_file("ancestry.json"); //for ancestry.spec.js tests
    data=flatten(read_json_file(filename)); //for shuffle tests
// simple linear scan
console.log("data: " + data + ",\narguments.length: " + arguments.length);
for(let i = 1; i < arguments.length; i++){
  console.log("arguments[i]: " + arguments[i] + ", i: " + i);
  for(let j = 0; j < data.length; j++){
    console.log("data[j].arguments[i]: " + data[j].arguments[i] + ", j: " + j);
      if(data[j].arguments[i] !== null){
        lst.concat(data[j].arguments[i]); // return data if found
      }
  }
}
return lst;
    //read_json_file("example1.json");
}
exports.summarize_mail = summarize_mail;
//console.log(flatten(summarize_mail("example1.json")));
//console.log("\n\n\n\n\n\n\n");
//console.log(summarize_mail("example1.json", "Subject", "Date"));
//exports.read_json_file=read_json_file;
