class ColaPila {
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

let pila = new ColaPila();
let returnedPila = new ColaPila();


console.log('Ingrese la palabra => ')
let input = process.openStdin();

input.addListener("data", (input) => {
    let string = input.toString().toUpperCase(); // to make it work without cases just do .toUpperCase(); and to be strict. just leave the toString();
    let arr = string.split(''); 

    for (let i = 0; i < arr.length; i++) {
        if (arr[i] !== '\n') {
            pila.push(arr[i]);
            console.log(pila.items);
        }
    }

    while (!pila.isEmpty()) {
        if (pila.peek() !== '\n') { // to determine if there's and eof, for comparison purposes
            returnedPila.push(pila.pop());  
        } else {
            pila.pop();
        }
        console.log(returnedPila.items); 
    }

    let reversedString = returnedPila.items.join(''); // make it a string without comas

    // search for global spaces, tabs... and replace-delete them
    string = string.replace(/\s/g, '');
    reversedString = reversedString.replace(/\s/g, '');

    console.log(" the reversed string is => " + reversedString + "\n" + " the original word was => " + string)


    // localeCompare(); if equal returns 0 else 1, or -1
    let comparison = string.localeCompare(reversedString);
    let comparison2 = reversedString.localeCompare(string);


    console.log("string == reversedString? => " + comparison)
    console.log("reversedString == string? => " + comparison2)

    // console.log("length string => " + string.length);
    // console.log("length reversed => " + reversedString.length);

    // console.log("type string => " + typeof (string));
    // console.log("type reversed => " + typeof (reversedString));

    if (comparison !== 0) {
        console.log(" the words is not palindrome \n");
    } else {
        console.log(" the words is palindrome \n");
    }

    process.exit();
});

