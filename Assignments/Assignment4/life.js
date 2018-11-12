var plan = [
    "############################",
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

class Vector {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
    plus(other) {
        return new Vector(this.x + other.x, this.y + other.y);
    }
};

class Grid {
    constructor (width, height) {
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

    forEach(f, context) {
        for (var y = 0; y < this.height; y++) {
            for (var x = 0; x < this.width; x++) {
                var value = this.space[x + y * this.width];
                if (value != null)
                    f.call(context, value, new Vector(x, y));
            }
        }
    }
}

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

class View {
    constructor(world, vector) {
        this.world = world;
        this.vector = vector;
    }
    look(dir) {
        var target = this.vector.plus(directions[dir]);
        if (this.world.grid.isInside(target))
            return charFromElement(this.world.grid.get(target));
        else
            return "#";
    }
    findAll(ch) {
        var found = [];
        for (var dir in directions)
            if (this.look(dir) == ch)
                found.push(dir);
        return found;
    }

    find(ch) {
        var found = this.findAll(ch);
        if (found.length == 0) return null;
        return randomElement(found);
    }
}

class World {
    constructor(map, legend) {
        var grid = new Grid(map[0].length, map.length);
        this.grid = grid;
        this.legend = legend;

        map.forEach(function(line, y) {
            for (var x = 0; x < line.length; x++)
                grid.set(new Vector(x, y),
                    World.elementFromChar(legend, line[x]));
        });
    }

    static elementFromChar(legend, ch) {
        if (ch == " ")
            return null;
        var element = new legend[ch]();
        element.originChar = ch;
        return element;
    }

    toString() {
        var output = "";
        for (var y = 0; y < this.grid.height; y++) {
            for (var x = 0; x < this.grid.width; x++) {
                var element = this.grid.get(new Vector(x, y));
                output += charFromElement(element);
            }
            output += "\n";
        }

        return output;
    }

    turn () {
        var acted = [];
        this.grid.forEach(function(critter, vector) {
            if (critter.act && acted.indexOf(critter) == -1) {
                acted.push(critter);
                this.letAct(critter, vector);
            }
        }, this);
    }
    letAct(critter, vector) {
        var action = critter.act(new View(this, vector));
        if (action && action.type == "move") {
            var dest = this.checkDestination(action, vector);
            if (dest && this.grid.get(dest) == null) {
                this.grid.set(vector, null);
                this.grid.set(dest, critter);
            }
        }
    }

    checkDestination(action, vector) {
        if (directions.hasOwnProperty(action.direction)) {
            var dest = vector.plus(directions[action.direction]);
            if (this.grid.isInside(dest))
                return dest;
        }
        return undefined;
    }

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
