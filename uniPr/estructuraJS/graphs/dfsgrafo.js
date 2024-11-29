class Node {
    value;
    visited;
    to;
    from;
    constructor(value) {
        this.value = value;
        this.visited = false;
        this.to = [];
        this.from = [];
    }

}

class grafo {
    source;
    length;

    constructor(source) {
        this.length = 0;
        this.source = null;
    }

    insert(value, visited, to, from) {
        this.length++;
        const newNode = new Node(value, visited, to, from);
        if (!this.source) {
            this.source = newNode;
            return;
        }
        newNode.from = []
        

        // source.value = 0;
    }
}

const graph = new grafo()

graph.insert(0,false,[1,2])
graph.insert(1,false,[0,2,4])
graph.insert(2,false,[1,3,0])
graph.insert(3,false,[2,4,6])
graph.insert(4,false,[1,3,5])
graph.insert(5,false,[6,4,2])
graph.insert(6,false,[3,5])

console.log(graph)
