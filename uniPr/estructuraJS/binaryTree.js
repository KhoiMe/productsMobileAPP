class Node {
    value;
    left;
    right;
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }

}
class BT {
    root;
    constructor() {
        this.root = null;
    }

    insert(value) {
        const newNode = new Node(value);

        if (!this.root) {
            this.root = newNode;
            return;
        }

        let curr = this.root;

        while (true) {
            if (value < curr.value) {
                if (!curr.left) {
                    curr.left = newNode;
                    return this;
                }
                curr = curr.left;
            } else {
                if (!curr.right) {
                    curr.right = newNode;
                    return this;
                }
                curr = curr.right;
            }

        }

    }
}


const binaryTree = new BT();
console.log(binaryTree.insert(10));
console.log(binaryTree.insert(6));
console.log(binaryTree.insert(15));
console.log(binaryTree.insert(3));
console.log(binaryTree.insert(8));
console.log(binaryTree.root)

let needle = 3;
let root = binaryTree.root.value

function search(curr, needle) {
    console.log(curr)
    if (!curr) {
        return false;
    }

    if (curr.value == needle) {
        return true;
    }

    if (curr.value < needle) {
        return search(curr.right, needle);
    }

    return search(curr.left, needle);
}

function dfs(root, needle) {
    return search(root, needle);
}


console.log("find it? => ", dfs(binaryTree.root, needle));

// pre_order_traverse
function walk_pre(curr, path) {
    if (!curr) {
        return path;
    }

    path.push(curr.value)

    walk_pre(curr.left, path)
    walk_pre(curr.right, path)
    return path;
}

function pre_order_traverse() {
    return walk_pre(binaryTree.root, [])
}

console.log("pre => ", pre_order_traverse())

// in_order_traverse
function walk_in(curr, path) {
    if (!curr) {
        return path;
    }


    walk_in(curr.left, path)
    path.push(curr.value)
    walk_in(curr.right, path)

    return path;
}

function in_order_traverse() {
    return walk_in(binaryTree.root, [])
}

console.log("in => ", in_order_traverse())

// post_order_traverse
function walk_post(curr, path) {
    if (!curr) {
        return path;
    }


    walk_post(curr.left, path)
    walk_post(curr.right, path)
    path.push(curr.value)

    return path;
}

function post_order_traverse() {
    return walk_post(binaryTree.root, [])
}

console.log("post =>", post_order_traverse())
