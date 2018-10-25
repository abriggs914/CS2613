function loop(i,str) {
    if (i>0) {
        console.log("\033c");
        console.log(str);
        setTimeout(function() { loop(i-1, str+"*"); }, 1000); // this is slow ~1 sec
    } else{
        console.log("all done!"); // this one will only print at the end.
    }
}

loop(20,"*");

//console.log("all done!"); //asynchronous execution, all done! will print almost immediately.
