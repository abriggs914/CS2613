let deep = require("../deepEqual.js");
describe("equal", function () {
    let obj = {here: {is: "an"}, object: 2};
    it("self", function () {
        expect(deep.deepEqual(obj,obj)).toBe(true);
    });

    it("null", function () {
        expect(deep.deepEqual(null,null)).toBe(true);
    });

    it("different", function () {
        expect(deep.deepEqual(obj, {here: 1, object: 2})).toBe(false);
    });

    it("equivalent", function () {
        expect(deep.deepEqual(obj, {here: {is: "an"}, object: 2})).toBe(true);
    });
});