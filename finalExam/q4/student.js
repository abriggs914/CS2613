let fs = require("../read_json_file.js");
class Student{
    constructor(name, id){
        this.name = name;
        this.id = id;
    }

    write(filename){
        fs.write_json_file(this, filename);
    }

    read(filename){
        fs.write_json_file(filename);
    }
}

exports.Student = Student;