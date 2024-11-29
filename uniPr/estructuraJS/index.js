class Cola {
    constructor() {
        this.items = [];
    }

    push(data) {
        this.items.push(data);
    }

    pop() {
        if (!this.isEmpty()) {
            return this.items.pop();
        } else {
            return this.items;
        }
    }

    shift() {
        if (!this.isEmpty()) {
            return this.items.shift();
        } else {
            return this.items;
        }
    }

    peek() {
        return this.items[this.items.length - 1];
    }

    getSize() {
        return this.items.length;
    }

    isEmpty() {
        return this.items.length === 0;
    }

}

let cola = new Cola();
// console.log(" la pila esta vacia"  , pila.isEmpty());
// lavado de platos con pilas -- implementar la funcionalidad de lavado de platos 
//
// for (let i = 1; i <= 10; i++) {
//     pila.push(i);
//     console.log('pila de platos actual => ', pila.items)
// }

// console.log('pila de platos inicial => ', pila.items)

// for (let i = 1; i <= 10; i++) {
//     console.log('plato lavado =>', pila.pop());
// 

// console.log('pila de platos final => ', pila.items)


console.log('Ingrese la cantidad de platos:');
const input = process.openStdin();

input.addListener("data", (input) => {
    let size = parseInt(input.toString());
    // parseInt can only read strings, so we need to make sure that we're giving strings
    //
    for (let i = 1; i <= size; i++) {
        cola.push('Plato ' + i);
        console.log(cola.items);
    }

    // for (let i = 1; i <= size; i++) {
    //     pila.pop();
    //    if (pila.isEmpty()) {
    //        console.log("la pila esta vacia");
    //    } else {
    //        console.log(pila.items);
    //    }
    // }


    for (let i = 1; i <= size; i++) {
        cola.shift();
        if (cola.isEmpty()) {
            console.log("la cola esta vacia");
        } else {
            console.log(cola.items);
        }
    }


    process.exit();
    // TODO: 
    // reverse string with pilas class
    //


    //dd
    // palabras palindromos()
});

//
//

//    // reverse string normal
console.log('Ingrese palabras :');
// let input = process.openStdin();

function reversedString(string) {
    return string.split('').reverse().join('');
}

input.addListener("data", (input) => {

    console.log(reversedString(input.toString()).toString());
    process.exit();

});


