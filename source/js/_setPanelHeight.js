const $ = require('jquery');

$(() => {
  const panels = $('.panel');
  const windowHeight = $(window).height();
  panels.each((i, v) => {
    $(v).height(windowHeight);
  });
});

module.exports = {
  setPanelHeight: 'setPanelHeight',
};
