var life = require("../life.js");
describe("World",
    function () {
        it("roundtrip",
            function() {
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
                let rows = world.toString.split("\n");
                rows.pop();
                expect(rows).toEqual(plan);
                //console.log(world.toString());


            });
    });