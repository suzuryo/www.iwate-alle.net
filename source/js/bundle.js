require('./_avoid_console_errors');
require('./_ga');

(() => {
  const hello = 'world';
  console.log(hello);
}).call();

module.export = {
  bundle: 'bundle',
};
