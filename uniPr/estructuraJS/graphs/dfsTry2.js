class Node {
    constructor(value) {
        this.value = value;
        this.connections = [];
    }

    addConnection(node) {
        if (node instanceof Node) {
            this.connections.push(node);
        } else {
            throw new Error('Can only connect to other Node instances');
        }
    }
}

const nodes = [];

function createNode(value) {
    const newNode = new Node(value);
    nodes.push(newNode);
    return newNode;
}

function isCyclicGraph(graph){
    const visited = new Set();
    const recStack = new Set();

    function dfs(node) {
        if (!node) return false;

        if (recStack.has(node)) return true;

        if (visited.has(node)) return false;

        visited.add(node);
        recStack.add(node);

        for (let neighbor of node.connections) {
            if (dfs(neighbor)) {
                return true;
            }
        }

        recStack.delete(node);

        return false;
    }
    return dfs(graph[0]);
}

const nodeA = createNode('A');
const nodeB = createNode('B');
const nodeC = createNode('C');
const nodeD = createNode('D');

nodeA.addConnection(nodeB);
nodeA.addConnection(nodeC);
nodeB.addConnection(nodeC);
nodeC.addConnection(nodeD);
nodeA.addConnection(nodeD);
nodeD.addConnection(nodeA);
nodeD.addConnection(nodeC);

const graph = [nodeA, nodeB, nodeC, nodeD];

console.log(isCyclicGraph(graph));
console.log(graph)

nodeD.connections = [];
console.log(graph)
console.log(isCyclicGraph(graph));
