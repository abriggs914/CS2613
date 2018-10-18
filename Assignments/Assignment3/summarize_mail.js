//let fs = require('fs');
let read_json_file = require("./read_json_file.js").read_json_file;
let flatten = require("./flatten.js").flatten;
let data = null;
let lst = null;
let name = null;

function summarize_mail(filename){
    data = null;
    lst = [];
    if (data===null){
    //data=read_json_file("ancestry.json"); //for ancestry.spec.js tests
        data = flatten(read_json_file(filename));

        for(var k = 0; k < arguments.length; k++){
            console.log("k: " + k + " arguments.length: " + arguments.length + ", arguments[k]: " + arguments[k]);
        }
        if(arguments.length < 2){
            console.log("No arguments given.");
          for(var k = 0; k < data.length; k++){
            lst.push({});
          }
        }
            for(var k = 0; k < data.length; k++){
              for(var l = 1; l < arguments.length; l++){
                let header = arguments[l];
                console.log("header: " + header);
                lst.push({header:data[k].headers[arguments[l]]});
              }
            }
        return lst; //for shuffle tests
  }
}
//read_json_file("example1.json");
//console.log("Result: " + summarize_mail("example1.json"));
exports.summarize_mail = summarize_mail;
console.log(summarize_mail("example1.json"));
//console.log("\n\n\n\n\n\n\n");
//console.log(summarize_mail("example1.json", "Subject", "Date"));
//exports.read_json_file=read_json_file;
console.log("\n");
console.log("\n");
console.log(summarize_mail("example1.json", 'Subject'));
