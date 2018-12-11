let fs = require('fs');

function read_json_file(filename) {
    return JSON.parse(fs.readFileSync(filename));
}

function write_json_file(obj,filename) {
    fs.writeFileSync(filename,JSON.stringify(obj));
}

exports.read_json_file=read_json_file;
exports.write_json_file=write_json_file;