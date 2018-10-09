let n = 0;
let msg;
while(n <= 100){
    msg = "";
    if(n % 3 == 0 && n != 0){
        msg += "Fizz";
        if(n % 5 == 0 ){
            msg += "\tFizzBuzz";
        }
        console.log(msg);
    }
    else if(n % 5 == 0 && n != 0){
        msg += "Buzz";
        if(n % 3 == 0 ){
            msg += "\tFizzBuzz";
        }
        console.log(msg);
    }
    else{
        console.log(n);
    }
    n++;
}