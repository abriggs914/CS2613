let life=require("./life.js");

let View=life.View;

let actionTypes = Object.create(null);

actionTypes.grow = function(critter) {
    critter.energy += 0.5;
    return true;
};

actionTypes.move = function(critter, vector, action) {
    let dest = this.checkDestination(action, vector);
    if (dest == null ||
        critter.energy <= 1 ||
        this.grid.get(dest) != null)
        return false;
    critter.energy -= 1;
    this.grid.set(vector, null);
    this.grid.set(dest, critter);
    return true;
};

actionTypes.eat = function(critter, vector, action) {
    let dest = this.checkDestination(action, vector);
    let atDest = dest != null && this.grid.get(dest);
    if (!atDest || atDest.energy == null)
        return false;
    console.log("atDest.energy: " + atDest.energy);
    critter.energy += atDest.energy;
    this.grid.set(dest, null);
    return true;
};

actionTypes.reproduce = function(critter, vector, action) {
    let baby = life.World.elementFromChar(this.legend,
        critter.originChar);
    let dest = this.checkDestination(action, vector);
    if (dest == null ||
        critter.energy <= 2 * baby.energy ||
        this.grid.get(dest) != null)
        return false;
    critter.energy -= 2 * baby.energy;
    this.grid.set(dest, baby);
    return true;
};

class LifelikeWorld extends life.World {
    constructor(map,legend){
        super(map,legend);
    }
    letAct(critter, vector) {
        let action = critter.act(new View(this, vector));
        let handled = action &&
            action.type in actionTypes &&
            actionTypes[action.type].call(this, critter,
                vector, action);
        if (!handled) {
            critter.energy -= 0.2;
            if (critter.energy <= 0)
                this.grid.set(vector, null);
        }
    }
}

class  Plant {
    constructor() {
        this.energy = 3 + Math.random() * 4;
    }
    
    act(view) {
        if (this.energy > 15) {
            let space = view.find(" ");
            if (space)
                return {type: "reproduce", direction: space};
        }
        if (this.energy < 20)
            return {type: "grow"};
    }
}

class  PlantEater{
    constructor () {
        this.energy = 20;
    }

    act(view) {
        let space = view.find(" ");
        if (this.energy > 60 && space)
            return {type: "reproduce", direction: space};
        let plant = view.find("*");
        if (plant)
            return {type: "eat", direction: plant};
        if (space)
            return {type: "move", direction: space};
    }
}

exports.LifelikeWorld=LifelikeWorld;
exports.BouncingCritter=life.BouncingCritter;
exports.Wall=life.Wall;
exports.PlantEater = PlantEater;
exports.Plant = Plant;
exports.Vector = life.Vector;
exports.View = life.View;