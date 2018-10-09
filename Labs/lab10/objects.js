x={ apple: 1};
x["pear"]=2;
x;
x.apple === x["apple"]; // == true
x.recurse = x; // puts the object inside itself
x.object = {other : "bob"};
x.list = ["hello", 1, {y : "world"}];
console.log(x);

obj = {};
obj.hello = function () { console.log("hello world\n"); };
obj.hello();
obj["hello"]();

x=[];
x[10]=1;
x;
x["10"] === x[10];
console.log(x);