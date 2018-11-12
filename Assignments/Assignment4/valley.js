var life=require("./moarlife.js");

var valley = new life.LifelikeWorld(
    ["############################",
        "#####****      &      ######",
        "##******                **##",
        "#****##** &      ***  O  *##",
        "#*&  ***     O   *##**    *#",
        "#   &   O        *##***    #",
        "#                *##**     #",
        "#   O       #*&            #",
        "#*          #**       O    #",
        "#***   &    ##**    O    **#",
        "##****     ###***       *###",
        "############################"],
    {"#": life.Wall,
        "O": life.PlantEater,
        "*": life.Plant,
        "&": life.ExplodingBunnyRabbit}
);

function loop () {
    valley.turn();
    console.log("\33c");
    console.log(valley.toString());
    setTimeout(function() { loop(); },250);
}

loop();
