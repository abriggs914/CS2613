class Vector {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
    plus(other) {
        return new Vector(this.x + other.x, this.y + other.y);
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
class Grid {
    constructor(width, height) {
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
  
class BouncingCritter {
    constructor() {
        this.direction = randomElement(directionNames);
    }
    act(view) {
        if (view.look(this.direction) != " ")
            this.direction = view.find(" ") || "s";
        return { type: "move", direction: this.direction };
    }
}

function elementFromChar(legend, ch) {
    if (ch == " ")
        return null;
    var element = new legend[ch]();
    element.originChar = ch;
    return element;
}
  
function World(map, legend) {
    var grid = new Grid(map[0].length, map.length);
    this.grid = grid;
    this.legend = legend;
  
    map.forEach(function(line, y) {
        for (var x = 0; x < line.length; x++)
            grid.set(new Vector(x, y),
                elementFromChar(legend, line[x]));
    });
}

function charFromElement(element) {
    if (element == null)
        return " ";
    else
        return element.originChar;
}
  
World.prototype.toString = function() {
    var output = "";
    for (var y = 0; y < this.grid.height; y++) {
        for (var x = 0; x < this.grid.width; x++) {
            var element = this.grid.get(new Vector(x, y));
            output += charFromElement(element);
        }
        output += "\n";
    }
    return output;
};
var plan = ["############################",
    "#      #    #      o      ##",
    "#                          #",
    "#          #####           #",
    "##         #   #    ##     #",
    "###           ##     #     #",
    "#           ###      #     #",
    "#   ####                   #",
    "#   ##       o             #",
    "# o  #         o       ### #",
    "#    #                     #",
    "############################"];
function Wall() {}
var world = new World(plan, {"#": Wall, "o": BouncingCritter});

var test = {
    prop: 10,
    addPropTo: function(array) {
        return array.map(function(elt) {
            return this.prop + elt;
        }.bind(this));
    }
};

var test = {
    prop: 10,
    addPropTo: function(array) {
        return array.map(function(elt) {
            return this.prop + elt;
        }, this); // ← no bind
    }
};

Grid.prototype.forEach = function(f, context) {
    for (let y = 0; y < this.height; y++) {
        for (let x = 0; x < this.width; x++) {
            let value = this.space[x + y * this.width];
            if (value != null)
                f.call(context, value, new Vector(x, y));
        }
    }
};
console.log(test.addPropTo([5]));
// → [15]
console.log(test.addPropTo([5]));
console.log(world.toString());

exports.Wall = Wall;
exports.World = World;
exports.BouncingCritter = BouncingCritter;
exports.Grid = Grid;
exports.Vector = Vector;