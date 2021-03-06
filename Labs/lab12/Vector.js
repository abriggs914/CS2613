class Vector{
    constructor(x, y){
        this.x = x;
        this.y = y;
    }
    plus(other){
        return new Vector (this.x + other.x, this.y + other.y);
    }
}

class Grid{
    constructor(width, height){
        this.space = new Array(width * height);
        this.width = width;
        this.height = height;
    }
    isInside(vector) {
        return vector.x >= 0 && vector.x < this.width &&
             vector.y >= 0 && vector.y < this.height;
    }
    get(vector) {
        return this.space[vector.x + this.width * vector.y];
    }
    set(vector, value) {
        this.space[vector.x + this.width * vector.y] = value;
    }
}

var grid = [["top left",    "top middle",    "top right"],
    ["bottom left", "bottom middle", "bottom right"]];
console.log(grid[1][2]);
// → bottom right

var grid = ["top left",    "top middle",    "top right",
    "bottom left", "bottom middle", "bottom right"];
console.log(grid[2 + (1 * 3)]);
// → bottom right

var grid = new Grid(5, 5);
console.log(grid.get(new Vector(1, 1)));
// → undefined
grid.set(new Vector(1, 1), "X");
console.log(grid.get(new Vector(1, 1)));
// → X
var directions = {
    "n":  new Vector( 0, -1),
    "ne": new Vector( 1, -1),
    "e":  new Vector( 1,  0),
    "se": new Vector( 1,  1),
    "s":  new Vector( 0,  1),
    "sw": new Vector(-1,  1),
    "w":  new Vector(-1,  0),
    "nw": new Vector(-1, -1)
};
function randomElement(array) {
    return array[Math.floor(Math.random() * array.length)];
}
  
var directionNames = "n ne e se s sw w nw".split(" ");
  
function BouncingCritter() {
    this.direction = randomElement(directionNames);
}
  
BouncingCritter.prototype.act = function(view) {
    if (view.look(this.direction) != " ")
        this.direction = view.find(" ") || "s";
    return {type: "move", direction: this.direction};
};
exports.Grid = Grid;
exports.Vector = Vector;