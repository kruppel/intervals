'use strict';

function pad(num) {
  let res = '';

  while (num--) {
    res += ' ';
  }

  return res;
}

class Node {
  constructor(value) {
    this.value = value;
    this.left = undefined
    this.right = undefined;
  }

  toJSON() {
    return {
      value: this.value,
      left: this.left,
      right: this.right
    }
  }
}

class Tree {
  add(value) {
    let node = this.root;

    if (!node) {
      this.root = new Node(value);
      return;
    }

    while (node) {
      let nodeValue = node.value;
      let dir;

      if (nodeValue > value) {
        dir = 'left';
      } else if (nodeValue < value) {
        dir = 'right';
      } else {
        break;
      }

      if (node[dir]) {
        node = node[dir];
      } else {
        node[dir] = new Node(value);
      }
    }
  }

  toJSON() {
    return this.root.toJSON();
  }
}

module.exports = Tree;
