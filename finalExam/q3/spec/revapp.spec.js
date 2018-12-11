revapp=require("../revapp.js").revapp;
describe("revapp", function () {
    it("letters", function () {
        expect(revapp(["a","b","c","d"])).toEqual("dcba");
    });});

// Testing the null case

describe("revapp NULL", function () {
    it("letters", function () {
        expect(revapp([])).toEqual("");
    });});