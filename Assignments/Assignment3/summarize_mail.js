//let fs = require('fs');
let read_json_file = require("./read_json_file.js").read_json_file;
let flatten = require("./flatten.js").flatten;
let data = null;
let lst = null;

function summarize_mail(filename){
    data = null;
    lst = null;
    if (data===null){}
    //data=read_json_file("ancestry.json"); //for ancestry.spec.js tests
        data=flatten(read_json_file(filename)); //for shuffle tests
        if(arguments.length <= 1){
          console.log("No arguments given.");
          return data;
        }
      // simple linear scan
      console.log("\tflatten(data): " + data + ",\n\targuments.length: " + arguments.length);
      for(var k = 0; k < arguments.length; k++){
        console.log("k: " + k + " arguments.length: " + arguments.length + ", arguments[k]: " + arguments[k]);
      }
      for(var k = 0; k < data.length; k++){
        console.log("k: " + k + " data.length: " + data.length + ", data[k].id: " + data[k].arguments[1]);
      }
      for(let i = 0; i < data.length; i++){
          for(let j = 1; j < arguments.length; j++){
              //console.log("data[j].arguments[i]: " + data[i].arguments[j] + ", j: " + j);
              if(data[i].arguments[j] !== null){
                  lst.concat(data[i].arguments[j]); // return data if found
              }
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
