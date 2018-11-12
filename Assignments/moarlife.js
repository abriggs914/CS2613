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
    // console.log("bool: " + bool);
    // console.log("atDest: " + atDest);
    // console.log("this.grid.get(dest): " +this.grid.get(dest));
    // console.log("\ndest == vector");
    // var propValue;
    // for(var propName in dest){
    //   propValue = dest[propName];
    //   console.log(propName,propValue);
    // }
    // console.log("\natDest");
    // for(var propName in atDest){
    //   propValue = atDest[propName];
    //   console.log(propName,propValue);
    // }
    // console.log("\ncritter");
    // for(var propName in critter){
    //   propValue = critter[propName];
    //   console.log(propName,propValue);
    // }
    // console.log("\nvector");
    // for(var propName in vector){
    //   propValue = vector[propName];
    //   console.log(propName,propValue);
    // }
    // console.log("\naction");
    // for(var propName in action){
    //   propValue = action[propName];
    //   console.log(propName,propValue);
    // }
    // console.log("\nthis.grid.get(dest)");
    // for(var propName in this.grid.get(dest)){
    //   propValue = this.grid.get(dest)[propName];
    //   console.log(propName,propValue);
    // }
    // console.log("!atDest: " + atDest);
    // console.log("\n!atDest");
    // if(!atDest){ // atDest == false
    //   for(let i = 0; i < 3; i++){
    //     console.log("BAMBOOZELED");
    //   }
    // }else {
    //   for(let i = 0; i < 3; i++){
    //     console.log("FOUND YOU MOTHERFUCKER");
    //   }
    //   console.log("\natDest.energy: " + atDest.energy + "\n!atDest:");
    //   for(var propName in !atDest){
    //     propValue = !atDest[propName];
    //     console.log(propName,propValue);
    //   }
    //   console.log("\n");
    // }
    if (!atDest || atDest.energy == null)
        return false;
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

// actionTypes.die = function(critter, vector) {
//   return true;
// }

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
      console.log("PlantEater acting");
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

class ExplodingBunnyRabbit extends PlantEater{
    constructor () {
      //console.log("typeof(EXPBRBT): " + typeof(ExplodingBunnyRabbit));
        super(); // object is not created I guess.
        this.rabbit = true;
        //this.energy = 20;
    }

    act(view) { // function is not called
      console.log("ExplodingBunnyRabbit acting");
        // let space = view.find(" ");
        // if(this.energy > 55){
        //   let chance = Math.floor((Math.random() * 4) + 1);
        //   if(chance == 1){
        //     //this.grid.set(vector, "#")
        //     return {type: "die", direction: space}
        //   }
        // }
        // if (this.energy > 60 && space)
        //     return {type: "reproduce", direction: space};
        // let plant = view.find("*");
        // if (plant)
        //     return {type: "eat", direction: plant};
        // if (space)
        //     return {type: "move", direction: space};
      }
}

exports.LifelikeWorld=LifelikeWorld;
exports.BouncingCritter=life.BouncingCritter;
exports.Wall=life.Wall;
exports.PlantEater = PlantEater;
exports.ExplodingBunnyRabbit=ExplodingBunnyRabbit;
exports.Plant = Plant;
exports.Vector = life.Vector;
exports.View = life.View;
