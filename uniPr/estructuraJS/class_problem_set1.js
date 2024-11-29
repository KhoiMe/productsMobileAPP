// Trees: los arboles son una estructura en la que los datos se dividen en;
// Root: padre; 
// Nodos: ramas;
// leafs: hojas

function bracketValidation(expr) {
    let stack = [];

    const pairs = {
        '(': ')',
        '[': ']',
        '{': '}'
    };

    for (let i = 0; i < expr.length; i++) {
        const c = expr[i];
        if (pairs[c]) {
            stack.push(c);
        } else {
            const last = stack.pop()
            if (pairs[last] !== c) {
                return false;
            }
        }
    }
    return stack.length === 0;
}

console.log(bracketValidation("(()"));
