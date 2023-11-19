let tick = 0;

const syncDB = () => {
  tick++;
  console.log('Running tick every 5 seconds: ', tick);

  return tick;
};

module.exports = { syncDB };
