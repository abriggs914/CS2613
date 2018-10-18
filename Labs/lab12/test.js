let test = {
    prop: 10,
    addPropTo: function(array) {
        /*let self = test;
        return array.map(function(elt) {
            return self.prop + elt;
        });*/
        return array.map(elt => this.prop+elt);
    }
};
console.log(test.addPropTo([1,2,3]));

function lala(arg1,arg2){
    return(this.name+arg1+arg2);
}
console.log(lala.call({name: "spongebob"}, " square", "pants"));