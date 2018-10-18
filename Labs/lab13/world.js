let life=require("./life.js");

let plan = ["############################",
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

let world = new life.World(plan, {"#": life.Wall, "o": life.BouncingCritter});

function loop(i,){
    if(i>0){
        world.turn();
        console.log("\033c");
        console.log(world.toString());
        setTimeout(function() {loop(i-1);}, 100);
    }
}

loop(100);
for (let i = 0; i < 5; i++) {
    world.turn();
    console.log(world.toString());
}