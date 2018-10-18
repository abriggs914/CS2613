/*
* CS2613 Assignment 3
* Oct.19/18 
* Avery Briggs
* 3471065
*
*
* JavaScript program to deal with header lines in 
* one of example1.json, example2.json or example3.json.
* Input file must be json and must be of the same format
* i.e. requires a header object with specific properties.
*/


let read_json_file = require("./read_json_file.js").read_json_file;
let flatten = require("./flatten.js").flatten;
let data = null;
let lst = null;

// Function summarize_mail reads a file of emails given from
// a json file. Program may or may not take parameters as to
// which properties (in the header object) wish to be reported.
// Function calls flatten to squish the objects into a single list
// to facilitate list traversal
// parameters - filename - name of the json file 
// return - lst - the finialized lst of properties from the file.
function summarize_mail(filename){
    data = null;
    lst = [];
    data = flatten(read_json_file(filename));
    if(arguments.length < 2){
        //console.log("No arguments given.");
        for(var k = 0; k < data.length; k++){ // creating null list of objects
            lst.push({});
        }
        return lst;
    }
    //create object inside inner loop, push object inside outer loop
    let curr = {};
    for(var k = 0; k < data.length; k++){
        curr = {};
        for(var l = 1, m = 0; l < arguments.length; l++, m++){
            curr[arguments[l]] = data[k].headers[arguments[l]]; // add object properties
        }
        lst.push(curr); // push object
    }
    return lst;
}

// Class Message acts as data structure to hold email header
// properties. Also provides simple accesses for their values
// Accessors: - subject - email's subject line
//            - date    - date the email was sent
//            - from    - the sender's email address
//            - to      - the recipient's email address
// Function equals simply returns true or false based on whether
// a given message is equal to the calling message.
class Message{
    constructor(email){
        this.subject = email.headers.Subject;
        this.date = email.headers.Date;
        this.from = email.headers.From;
        this.to = email.headers.To;
    }
    equals(msg){
        return (this === msg);
    }
}

exports.summarize_mail = summarize_mail;
exports.Message = Message;

/*    Test for summarize_mail method
console.log("\n");
console.log(summarize_mail("example1.json")); //test1
console.log("\n");
console.log(summarize_mail("example1.json", 'Subject')); //test2
console.log("\n");
console.log(summarize_mail("example1.json", "Subject", "Date")); //test3
*/

/*    Test for Message class
let testMsg = new Message({"headers": {"Subject" : "lunch", "Date" : "now"}});
let otherMsg = new Message({"headers": {"Subject" : "dinner", "Date" : "now"}});
console.log("message: " + typeof(testMsg));
console.log("message: " + testMsg.length);
console.log("testMsg.subject: " + testMsg.subject);
console.log("testMsg.date: " + testMsg.date);
console.log("testMsg.equals(testMsg): " + testMsg.equals(testMsg));
console.log("testMsg.equals(otherMsg): " + testMsg.equals(otherMsg));
*/