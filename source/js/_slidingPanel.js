const $ = require('jquery');
const _ = require('lodash');
const page = require('page');

const resetClass = () => {
  $('.summary > li').removeClass('slide_out');
  $('.contents > li').removeClass('selected', 'content-visible');
  $('a.nav-trigger').removeClass('project-open', 'nav-visible');
};

const slideOut = () => {
  $('.summary > li').addClass('slide_out');
};

const test1 = (e) => {
  console.log(e);
  const hs = _.replace(e.path, /^\/#|^\/$/, '');
  switch (hs) {
    case 'goal':
      $('.summary li.goal div.p_t').hide();
      resetClass();
      slideOut();
      $('.contents > li.goal').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      break;
    case 'activities':
      $('.summary li.activities div.p_t').hide();
      resetClass();
      slideOut();
      $('.contents > li.activities').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      break;
    case 'line_at':
      $('.summary li.line_at div.p_t').hide();
      resetClass();
      slideOut();
      $('.contents > li.line_at').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      break;
    case 'network':
      $('.summary li.network div.p_t').hide();
      resetClass();
      slideOut();
      $('.contents > li.network').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      break;
    case 'primary-nav':
      $('a.nav-trigger').addClass('nav-visible');
      resetClass();
      slideOut();

    default:
      $('.summary div.p_t').show();
      resetClass();
      break;
  }
};

page('*', test1);
page({hashbang:true});

module.exports = {
  slidingPanel: 'slidingPanel',
};
