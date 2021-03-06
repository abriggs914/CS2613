class Vector {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
    plus(other) {
        return new Vector(this.x + other.x, this.y + other.y);
    };
};

class Grid {
    constructor (width, height) {
        this.space = new Array(width * height);
        this.width = width;
        this.height = height;
    };

    isInside(vector) {
        return vector.x >= 0 && vector.x < this.width &&
            vector.y >= 0 && vector.y < this.height;
    };

    get(vector) {
        return this.space[vector.x + this.width * vector.y];
    };
    
    set(vector, value) {
        this.space[vector.x + this.width * vector.y] = value;
    };

    forEach(f, context) {
        for (let y = 0; y < this.height; y++) {
            for (let x = 0; x < this.width; x++) {
                let value = this.space[x + y * this.width];
                if (value != null)
                    f.call(context, value, new Vector(x, y));
            }
        }
    };
}

let directions = {
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

let directionNames = "n ne e se s sw w nw".split(" ");

function BouncingCritter() {
    this.direction = randomElement(directionNames);
};

BouncingCritter.prototype.act = function(view) {
    if (view.look(this.direction) != " ")
        this.direction = view.find(" ") || "s";
    return {type: "move", direction: this.direction};
};


function elementFromChar(legend, ch) {
    if (ch == " ")
        return null;
    let element = new legend[ch]();
    element.originChar = ch;
    return element;
}

function World(map, legend) {
    let grid = new Grid(map[0].length, map.length);
    this.grid = grid;
    this.legend = legend;

    map.forEach(function(line, y) {
        for (let x = 0; x < line.length; x++)
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
    let output = "";
    for (let y = 0; y < this.grid.height; y++) {
        for (let x = 0; x < this.grid.width; x++) {
            let element = this.grid.get(new Vector(x, y));
            output += charFromElement(element);
        }
        output += "\n";
    }
    return output;
};

function Wall() {};

exports.BouncingCritter=BouncingCritter;
exports.Grid=Grid;
exports.Wall=Wall;
exports.World=World;
exports.Vector=Vector;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      }
}

function charFromElement(element) {
    if (element == null)
        return " ";
    else
        return element.originChar;
}


function Wall() {}

exports.BouncingCritter=BouncingCritter;
exports.Grid=Grid;
exports.Wall=Wall;
exports.World=World;
exports.Vector=Vector;
exports.View=View;