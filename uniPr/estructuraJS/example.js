function esValida(expresion) {
    const pila = [];
    const pares = {
        ')': '(',
        ']': '[',
        '}': '{'
    };
    
    for (let char of expresion) {
        if (char === '(' || char === '[' || char === '{') {
            pila.push(char);
        } else if (char === ')' || char === ']' || char === '}') {
            if (pila.length === 0 || pares[char] !== pila.pop()) {
                return false;
            }
        }
    }
    
    return pila.length === 0;
}

// Ejemplos de uso
const cadenaValida = "{[()]}";
const cadenaInvalida = "[{(])}";

console.log(esValida(cadenaValida));  // Output: true
console.log(esValida(cadenaInvalida));
