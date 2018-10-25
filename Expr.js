class Expr {
  constructor(xpr, a, b){
    this.xpr = xpr;
    this.a = a;
    this.b = b;
    this.val = this.eval();
  }

  toString(){
    return this.val;
  }

  eval(){
    var res;
    let a = Number(this.a);
    let b = Number(this.b);
    let xpr = this.xpr;
    if(xpr == '+'){
      res = a+b;
    }
    else if(xpr == '*'){
      res = a*b;
    }
    return res;
  }
}
console.log("hey there");
let six_plus_nine = new Expr('+', 6, 9);
let six_times_nine = new Expr('*', 6, 9);
let hard = new Expr('+', six_times_nine, six_plus_nine);
let hard2 = new Expr('*', six_times_nine, hard);
