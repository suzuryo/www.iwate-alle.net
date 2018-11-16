// Avoid `console` errors in browsers that lack a console.
(() => {
  const noop = () => {};
  const methods = [
    'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
    'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
    'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
    'timeline', 'timelineEnd', 'timeStamp', 'trace', 'warn',
  ];

  const console = (window.console = window.console || {});

  methods.forEach((v) => {
    if (!console[v]) {
      console[v] = noop;
    }
  });
}).call();

module.exports = {
  avoid_console_errors: 'avoid_console_errors',
};
