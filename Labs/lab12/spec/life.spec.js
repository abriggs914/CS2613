let life=require ("../life.js");
let vec=require ("../Vector.js");

describe("Grid life",
    function() {
        let Vector = life.Vector;
        it("initially undefined",
            function() {
                let grid = new life.Grid(5, 5);

                expect(grid.get(new Vector(1, 1))).toBe(undefined);
            });

        it("setting a value",
            function() {
                let grid = new life.Grid(5, 5);
                grid.set(new Vector(1, 1), "X");

                expect(grid.get(new Vector(1, 1))).toEqual("X");
            });
    });

describe("Grid vec",
    function() {
        let Vector = vec.Vector;
        it("initially undefined",
            function() {
                let grid = new vec.Grid(5, 5);

                expect(grid.get(new Vector(1, 1))).toBe(undefined);
            });

        it("setting a value",
            function() {
                let grid = new vec.Grid(5, 5);
                grid.set(new Vector(1, 1), "X");

                expect(grid.get(new Vector(1, 1))).toEqual("X");
            });
    });

it("forEach",
    function() {
        let Vector = vec.Vector;
        let grid = new vec.Grid(5, 5);
        let test = {grid: grid,  sum: 0,
            method: function () {
                this.grid.forEach(function() { this.sum++; }, this);
            }
        };

        test.grid.set(new Vector(2,3), "#");
        test.grid.set(new Vector(3,4), "#");
        test.method();

        expect(test.sum).toBe(3);
    });