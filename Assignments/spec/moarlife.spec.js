let life=require ("../moarlife.js");

let Vector = life.Vector;

let plan= ["############################",
    "#####                 ######",
    "##   ***                **##",
    "#   *##**         **  O  *##",
    "#    ***     O    ##**    *#",
    "#       O         ##***    #",
    "#                 ##**     #",
    "#   O       #*             #",
    "#*          #**       O    #",
    "#***        ##**    O    **#",
    "##****     ###***       *###",
    "############################"];


describe("World",
    function () {
        let src=new life.Vector(4,7);
        let dest=new life.Vector(4,8);
        let plantsrc = new Vector(2,9);
        let valley=null;
        let bob=null;
        let bunny=null;
        let plant=null;
        beforeEach(function() {
            valley = new life.LifelikeWorld(plan,
                {"#": life.Wall,
                    "O": life.PlantEater,
                    "&": life.ExplodingBunnyRabbit,
                    "*": life.Plant});

            bob=valley.grid.get(src);
            bunny = valley.grid.get(new Vector(15,2));

            plant = valley.grid.get(plantsrc);

        });

        it("roundtrip",
            function() {
                let rows = valley.toString().split("\n");
                // drop blank row
                rows.pop();

                expect(rows).toEqual(plan);
            });

        describe("letAct", function () {
            it("move", function () {
                spyOn(bob,"act").and.returnValue({type: "move", direction: "s"});
                valley.letAct(bob, src);

                expect(valley.grid.get(dest)).toEqual(bob);
            });

            it("move, low energy", function () {
                spyOn(bob,"act").and.returnValue({type: "move", direction: "s"});
                bob.energy=0.5;
                valley.letAct(bob, src);

                expect(valley.grid.get(dest)).toEqual(null);
            });

            it("eat, return false", function () {
                spyOn(bob,"act").and.returnValue({type: "eat", direction: "s"});
                let before = bob.energy;
                valley.letAct(bob, src);

                expect(bob.energy).toEqual(before-0.2);
            });

            // addition
            it("eat, return true", function () {
                spyOn(bob,"act").and.returnValue({type: "move", direction: undefined});
                let before = bob.energy;
                valley.letAct(bob, src);

                expect(bob.energy).toEqual(before);
            });
            // addition

            it("grow", function () {
                spyOn(plant,"act").and.returnValue({type: "grow", direction: "s"});
                let before = plant.energy;
                valley.letAct(plant, plantsrc);

                expect(plant.energy).toEqual(before+0.5);
            });
                 
            it("reproduce attempt, return false", function () {
                spyOn(bob,"act").and.returnValue({type: "reproduce", direction: "s"});
                valley.letAct(bob, src);

                expect(valley.grid.get(src)).toEqual(bob);
            });

            it("reproduce attempt, true", function () {
                spyOn(bob,"act").and.returnValue({type: "reproduce", direction: "s"});
                bob.energy=1000;
                valley.letAct(bob, src);

                expect(valley.grid.get(src)).toEqual(bob);
            });

            it("use energy", function () {
                spyOn(bob,"act").and.returnValue({type: "unhandled", direction: undefined});
                bob.energy=1;
                valley.letAct(bob, src);

                expect(bob.energy).toEqual(0.8);
            });

            it("run out of energy", function () {
                spyOn(bob,"act").and.returnValue({type: "unhandled", direction: undefined});
                bob.energy=0.1;
                valley.letAct(bob, src);

                expect(valley.grid.get(src)).toEqual(null);
            });
        });

        describe("act", function() {
            let view = null;
            beforeEach(function () {
                view=new life.View(valley, src);
            });


            it("eat",
                function () {
                    spyOn(view,"find").and.returnValue("*");

                    expect(bob.act(view).type).toEqual("eat");
                });

            it("move",
                function () {
                    expect(bob.act(view).type).toEqual("move");
                });

            it("can't move",
                function () {
                    spyOn(view,"find").and.returnValue(null);

                    expect(bob.act(view)).toEqual(undefined);
                });

            it("reproduce",
                function () {
                    bob.energy=61;

                    expect(bob.act(view).type).toEqual("reproduce");
                });
        });

        describe("plant",
            function() {
                beforeEach(function () {
                    view=new life.View(valley, plantsrc);
                });

                it("print",
                    function () {
                        expect(plant.originChar).toBe("*");
                    });

                it("reproduce",
                    function () {
                        plant.energy=16;
                        spyOn(Math,"random").and.returnValue(0.99);

                        expect(plant.act(view).type).toEqual("reproduce");
                    });

                it("reproduce, no room, grow",
                    function () {
                        let plantsrc = new Vector(2,10);
                        let plant = valley.grid.get(plantsrc);
                        plant.energy=16;
                        let view = new life.View(valley,plantsrc);

                        expect(plant.act(view).type).toEqual("grow");
                    });


                it("grow",
                    function () {
                        spyOn(Math,"random").and.returnValue(0);
                        plant.energy=11;

                        expect(plant.act(view).type).toEqual("grow");
                    });
            });
    });