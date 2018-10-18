let sm = require("../summarize_mail.js");
let summarize_mail = require("../summarize_mail.js").summarize_mail;
let read_json_file = require("../read_json_file.js").read_json_file;
let flatten = require("../flatten.js").flatten;

describe("summarize_mail",
    function() {
        it("no headers",
            function () {
                expect(summarize_mail("example1.json")).toEqual([{}, {}, {}]);
                expect(summarize_mail("example2.json")).toEqual(Array(10).fill({}));
            });

        it("Subject",
            function () {
                expect(summarize_mail("example1.json","Subject")).toEqual([{Subject: "[notmuch] archive"},
                    {Subject: "Re: [notmuch] archive"},
                    {Subject: "Re: [notmuch] archive"}]);
            });

        it("Subject, Date",
            function () {
                expect(summarize_mail("example1.json","Subject","Date")).toEqual(
                    [{Subject: "[notmuch] archive", Date: "Tue, 17 Nov 2009 18:21:38 -0500"},
                        {Subject: "Re: [notmuch] archive", Date: "Tue, 17 Nov 2009 18:04:31 -0800"},
                        {Subject: "Re: [notmuch] archive", Date: "Wed, 18 Nov 2009 02:22:12 -0800"}]);
            });
    });

let testMsg = new sm.Message({"headers": {"Subject" : "lunch", "Date" : "now"}});
describe("Message class",
    function() {
        it("new message is not null",
            function () {
                expect(testMsg).not.toEqual(null);
            });

        it("subject accessor",
            function () {
                expect(testMsg.subject).toEqual("lunch");
            });
        
        it("Json input",
            function () {
                let file = flatten(read_json_file("example1.json"));
                //console.log("file[0].headers.Subject: " + file[0].headers.Subject);
                let email = new sm.Message(file[0]);
                //testing a json input.
                expect(email.subject).toEqual("[notmuch] archive");
                expect(email.to).toEqual("notmuch <notmuch@notmuchmail.org>");
            });

        let otherMsg = new sm.Message({"headers": {"Subject" : "dinner", "Date" : "now"}});
        it("message is equal to itself",
            function () {
                expect(testMsg.equals(testMsg)).toEqual(true);
            });

        it("message is not equal if field changes",
            function () {
                expect(testMsg.equals(otherMsg)).toEqual(false);
            });

        it("checking using json input",
            function () {
                let file = flatten(read_json_file("example1.json"));
                let email1 = new sm.Message(file[0]);
                let email2 = new sm.Message(file[1]);
                let email3 = new sm.Message(file[2]);

                expect(email1.equals(email1)).toEqual(true);
                expect(email1.equals(email2)).toEqual(false);
                expect(email1.equals(email3)).toEqual(false);
            });
    });