
const $ = require('jquery');

$(() => {
  $(window).on('hashchange', (e) => {
    console.log(window.location.hash);
  });
});

module.exports = {
  slidingPanel: 'slidingPanel',
};
