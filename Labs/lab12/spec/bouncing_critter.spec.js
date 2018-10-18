var life = require("../life.js");
describe("BouncingCritter",
    function () {
        it("constructor",
            function () {
                let bob = new life.BouncingCritter();

                expect('direction' in bob).toBe(true);
                expect(bob.direction).toBe("s");
            });
    });

describe("BouncingCritter",
    function () {
        let bob = null;
        beforeEach(function () {
            spyOn(Math, "random").and.returnValue;
            bob = new life.BouncingCritter();
        });

        it("constructor",
            function () {
                expect("direction" in bob).toBe(true);
                expect(bob.direction).toBe("s");
            });
    });
/*
it("act ",
function(){
    let bob = new life.BouncingCritter();
    expect(bob.act({look: function() {return " ";}})
    .toEqual({type: "move", direction : "s"}));
});*/