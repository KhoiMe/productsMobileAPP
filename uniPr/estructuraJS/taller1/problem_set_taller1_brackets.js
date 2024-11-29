// Binary tree
// Un árbol es un conjunto finito de elementos, llamados nodos, que satisfacen las siguientes condiciones:
// El árbol contiene un nodo especial llamado raíz. No hay ninguna arista que apunte hacia la raíz desde otro nodo.
// Cada nodo, excepto la raíz, está conectado por exactamente una arista a otro nodo, que se llama el padre de ese nodo.
// Desde cualquier nodo del árbol, se puede alcanzar cualquier otro nodo a través de un camino único.
class Pila {
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

// const bracketString = "{[(])}"; // not valid
const bracketString = "{[()]}"; // valid
// const bracketString = "(())"; // valid

function isValid(expr) {
    let pila = new Pila();
    const pairs = {
        '(': ')',
        '[': ']',
        '{': '}'
    };

    for (let i = 0; i < expr.length; i++) {
        const c = expr[i];
        if (pairs[c]) {
            pila.push(c)
        } else {
            const last = pila.pop();
            if (pairs[last] !== c) {
                return false;
            }
        }
    }
    return pila.isEmpty();
}


console.log("Valid characters => ", isValid(bracketString))
