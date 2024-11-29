declare type CompleteGraphEdge = { from: number; to: number; weight: number };
declare type GraphEdge = { to: number; weight: number };
declare type WeightedAdjacencyList = GraphEdge[][];

declare type AdjacencyList = number[][];

const list: WeightedAdjacencyList = [];

//     >(1)<--->(4) ---->(5)
//    /          |       /|
// (0)     ------|------- |
//    \   v      v        v
//     >(2) --> (3) <----(6)
list[0] = [
    { to: 1, weight: 3 },
    { to: 2, weight: 1 },
];
list[1] = [
    { to: 4, weight: 1 },
];
list[2] = [
    { to: 3, weight: 7 },
];
list[3] = [];
list[4] = [
    { to: 1, weight: 1 },
    { to: 3, weight: 5 },
    { to: 5, weight: 2 },
];
list[5] = [
    { to: 2, weight: 18 },
    { to: 6, weight: 1 },
];
list[6] = [
    { to: 3, weight: 1 },
];

//     >(1)<--->(4) ---->(5)
//    /          |       /|
// (0)     ------|------- |
//    \   v      v        v
//     >(2) --> (3) <----(6)


function walk(
    graph: WeightedAdjacencyList,
    curr: number,
    needle: number,
    seen: boolean[],
    path: number[]): boolean {

    if (seen[curr]) {
        return false;
    }

    seen[curr] = true;
    //pre 
    path.push(curr);

    if (curr === needle) {
        return true;
    }
    //recurse
    const list = graph[curr];

    for (let i = 0; i < list.length; ++i) {
        const edge = list[i];

        if (walk(graph, edge.to, needle, seen, path)) {
            return true;
        }
    }

    //post
    path.pop();
    return false;
}

function dfs(
    graph: WeightedAdjacencyList,
    source: number,
    needle: number): number[] | null {

    const seen: boolean[] = [];
    const path: number[] = [];

    walk(graph, source, needle, seen, path);

    if (path.length === 0) {
        return null;
    }

    return path;
}

function isCiclic(
    graph: WeightedAdjacencyList,
    curr: number,
    source: number,): boolean {

    const path: number[] = []
    const seen: boolean[] = [];

    const list = graph[curr];
    for (let i = 0; i < list.length; ++i) {
        const edge = list[i]
        const found = path.find()
        if(walk(graph, source, edge.to , seen, path) && ) {
        }
    }

    if (path.length === 0) {
        return false;
    }

}


console.log(dfs(list, 0, 6))

