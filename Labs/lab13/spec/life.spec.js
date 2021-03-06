let life = require("../life.js");

describe("Grid",
    function () {
        let Vector = life.Vector;
        it("initially undefined",
            function () {
                let grid = new life.Grid(5, 5);

                expect(grid.get(new Vector(1, 1))).toBe(undefined);
            });

        it("setting a value",
            function () {
                let grid = new life.Grid(5, 5);
                grid.set(new Vector(1, 1), "X");

                expect(grid.get(new Vector(1, 1))).toEqual("X");
            });

        it("forEach",
            function () {
                let grid = new life.Grid(5, 5);
                let test = {
                    grid: grid, sum: 0,
                    method: function () {
                        this.grid.forEach(function () { this.sum++; }, this);
                    }
                };

                test.grid.set(new Vector(2, 3), "#");
                test.grid.set(new Vector(3, 4), "#");
                test.method();

                expect(test.sum).toBe(2);
            });
    });

describe("BouncingCritter",
    function () {
        let bob = null;
        beforeEach(function () {
            spyOn(Math, "random").and.returnValue(0.5);
            bob = new life.BouncingCritter();
        });

        it("constructor",
            function () {
                expect("direction" in bob).toBe(true);
                expect(bob.direction).toBe("s");
            });

        it("act, clear path",
            function () {
                let clear = { look: function () { return " "; } };

                expect(bob.act(clear)).toEqual({ type: "move", direction: "s" });
            });

        it("act, unclear path",
            function () {
                let unclear = { look: function () { return "#"; }, find: function () { return "n"; } };

                expect(bob.act(unclear)).toEqual({ type: "move", direction: "n" });
            });
    });

describe("World",
    function () {
        it("roundtrip",
            function () {
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
                let world = new life.World(plan, { "#": life.Wall, "o": life.BouncingCritter });
                let rows = world.toString().split("\n");
                // drop blank row
                rows.pop();

                expect(rows).toEqual(plan);
            });
    });                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Critter});
        });
        let position=new Vector(15,9);
        it("constructor",
            function () {
                let view=new View(world, position);

                expect(view.vector).toEqual(position);
            });

        it("look",
            function () {
                let view=new View(world, position);

                expect(view.look("s")).toEqual(" ");
            });

        it("findAll",
            function () {
                let view=new View(world, position);
                let directionNames = [ "e", "n", "ne", "nw", "s", "se", "sw", "w" ];

                expect(view.findAll(" ").sort()).toEqual(directionNames);
            });
            
        it("find",
            function () {
                spyOn(Math, "random").and.returnValue(0.5);
                let view=new View(world, position);

                expect(view.find(" ")).toBe("s");
            });

        it("look outside",
            function () {
                let position=new Vector(0,0);
                let view =new View(world, position);

                expect(view.look("s")).toBe("#");
            });
            
        it("find nonexistent",
            function () {
                let view=new View(world, position);
                spyOn(Math, "random").and.returnValue(0.5);

                expect(view.find("@")).toBe(null);
            });
            
        it("act, unclear path, find returns null",
            function () {
                let src=new life.Vector(19,1);
                let dest=new life.Vector(19,2);
                let bob=world.grid.get(src);
                let unclear = {look: function () {return "#";}, find: function () { return;     }};

                expect(bob.act(unclear)).toEqual({type: "move", direction: "s"});
            });
            
        it("letAct, act returns null",
            function () {
                let src=new life.Vector(19,1);
                let dest=new life.Vector(19,2);
                let bob=world.grid.get(src);
                spyOn(bob,"act").and.returnValue(null);
                world.letAct(bob, src);

                expect(world.grid.get(dest)).toBe(null);
            });

    });

    