//(string-append "Hello\n" "world!")
let y = "Hello\n" + "world!";
console.log(y);

//(* (+ 1 2 3) 7)
console.log((1 + 2 + 3)  * 7);

//(< 41 (* 6 7))
let n = 6 * 7;
if(n > 41){
    console.log("#t");}
else{
    console.log("#f");}

//(equal? (* (+ 1 2 3) 7) 42) 
n = (1 + 2 + 3) * 7;
if(n == 42){
    console.log("#t");}
else{
    console.log("#f");}

//(equal? "Spongebob" "Squarepants")
if("Spongebob" == "Squarepants"){
    console.log("#t");}
else{
    console.log("#f");}

//(and (equal? (* 6 7) 42) (equal? "Spongebob" "Squarepants"))
n = (6 * 7);
if(n == 42 && "Spongebob" == "Squarepants"){
    console.log("#t");}
else{
    console.log("#f");}

//(equal? 42 (if (< 3 5) (* 6 7) "turnip"))
let m;
n = (3 < 5);
let p;
if(n){
    p = 6 * 7;
}
else{
    p = "turnip";
}
if(p == 42){
    console.log("#t"); 
}
else{
    console.log("#f");
}

//(or #t (/ 1 0))
n = true;
m = 1 / 0;
if(n || m){
    console.log("#t"); 
}
else{
    console.log("#f");
}

//(and #f (/ 1 0))
n = false;
m = 1 / 0;
if(!(!n || !m)){
    console.log("#t"); 
}
else{
    console.log("#f");
} 
