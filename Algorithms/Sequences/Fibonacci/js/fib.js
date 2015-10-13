#!/usr/bin/env node

'use strict';

module.exports = function *fib() {
  let f1 = 0;
  let f2 = 1;

  yield f1;
  yield f2;

  while (true) {
    let curr = f2;

    f2 = f1 + f2;
    f1 = curr;

    yield f2;
  }
}
