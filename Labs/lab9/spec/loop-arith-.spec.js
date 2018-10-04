var arith = require("../loop-arith.js");
console.log(arith.plus(2,2));

describe("add",
    function() {
        it("1 + 1 = 2",
            function() {
                expect(arith.plus(1,1)).toBe(2);
            });

        it("0 + 9 = 9",
            function() {
                expect(arith.plus(0,9)).toBe(9);
            });
    });

describe("mult",
    function() {
        it("0 * 2 = 0", function() {
            expect(arith.mult(0,2)).toBe(0);
        });

        it("1 * 2 = 2", function() {
            expect(arith.mult(1,2)).toBe(2);
        });

        it("2 * 2 = 4", function() {
            expect(arith.mult(2,2)).toBe(4);
        });
    });

describe("mult2",
    function() {
        it("0 * 3 = 0", function() {
            expect(arith.mult2(0,3)).toBe(0);
        });

        it("1 * 3 = 3", function() {
            expect(arith.mult2(1,3)).toBe(3);
        });

        it("2 * 6 = 12", function() {
            expect(arith.mult2(2,6)).toBe(12);
        });
    });