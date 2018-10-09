function makemap (){
    let map={};
    if (arguments.length %2 != 0)
        return map;

    //reading first obj as property name and second as value
    for (let i=0; i<arguments.length; i+=2) {
        map[arguments[i]] = arguments[i + 1];
    }

    return map;

}

console.log(makemap("bob", 1, "mary", 2));