const $ = require('jquery');
const _ = require('lodash');
const page = require('page');

const resetClass = () => {
  $('.summary > li').removeClass('slide_out');
  $('.contents > li').removeClass('selected', 'content-visible');
};

const slideOut = () => {
  $('.summary > li').addClass('slide_out');
};

const test1 = (e) => {
  console.log(e);
  const hs = _.replace(e.path, /^\/#|^\/$/, '');
  switch (hs) {
    case 'goal':
      resetClass();
      slideOut();
      $('.contents > li.goal').addClass('selected', 'content-visible');
      break;
    case 'activities':
      resetClass();
      slideOut();
      $('.contents > li.activities').addClass('selected', 'content-visible');
      break;
    case 'line_at':
      resetClass();
      slideOut();
      $('.contents > li.line_at').addClass('selected', 'content-visible');
      break;
    case 'network':
      resetClass();
      slideOut();
      $('.contents > li.network').addClass('selected', 'content-visible');
      break;
    default:
      resetClass();
      break;
  }
};

page('*', test1);
page({hashbang:true});

module.exports = {
  slidingPanel: 'slidingPanel',
};
