function revapp(lst) {
    let res = lst;
    res = res.reverse();
    res = res.reduce((phrase, subList) =>{
        return phrase+subList;
    },"");
    return res;
}
// let a = ["a","b","c","d"];
// console.log("revapp: " + revapp(a));

exports.revapp = revapp;