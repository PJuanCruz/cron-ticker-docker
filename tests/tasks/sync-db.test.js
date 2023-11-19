const { syncDB } = require('../../tasks/sync-db');

describe('syncDB', () => {
  test('should increment the tick variable by 1 on each function call', () => {
    let tick;
    tick = syncDB();
    tick = syncDB();
    tick = syncDB();

    expect(tick).toBe(3);
  });
});
