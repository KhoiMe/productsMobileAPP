var list = [];
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
function walk(graph, curr, needle, seen, path) {
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
    var list = graph[curr];
    for (var i = 0; i < list.length; ++i) {
        var edge = list[i];
        if (walk(graph, edge.to, needle, seen, path)) {
            return true;
        }
    }
    //post
    path.pop();
    return false;
}
function dfs(graph, source, needle) {
    // const seen: boolean[] = new Array(graph.length).fill(false);
    var seen = [];
    var path = [];
    walk(graph, source, needle, seen, path);
    if (path.length === 0) {
        return null;
    }
    return path;
}
console.log(dfs(list, 0, 2));
