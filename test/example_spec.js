const assert = require('power-assert');

const author = 'suzuryo';

describe('example', () => {
  it('author', () => {
    assert(author === 'suzuryo');
  });
  it('2+3 eq 5', () => {
    assert(2 + 3 === 5);
  });
});
