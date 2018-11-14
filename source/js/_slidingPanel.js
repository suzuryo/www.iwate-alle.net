const $ = require('jquery');
const page = require('page');

const resetClass = () => {
  $('.summary > li').removeClass('slide_out');
  $('.contents > li').removeClass('selected', 'content-visible');
  $('a.nav-trigger').removeClass('project-open', 'nav-visible');
  $('div.container').removeClass('project-open');
};

const slideOut = () => {
  $('.summary > li').addClass('slide_out');
};

const main = (e) => {
  const hs = e.path.replace(/^\/#|^\/$/, '');
  switch (hs) {
    case 'goal':
      $('.summary li.goal div.p_t').hide();
      resetClass();
      slideOut();
      $('ul.contents > li.goal').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      $('div.container').addClass('project-open');
      break;
    case 'activities':
      $('.summary li.activities div.p_t').hide();
      resetClass();
      slideOut();
      $('ul.contents > li.activities').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      $('div.container').addClass('project-open');
      break;
    case 'disaster':
      $('.summary li.disaster div.p_t').hide();
      resetClass();
      slideOut();
      $('ul.contents > li.disaster').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      $('div.container').addClass('project-open');
      break;
    case 'network':
      $('.summary li.network div.p_t').hide();
      resetClass();
      slideOut();
      $('ul.contents > li.network').addClass('selected', 'content-visible');
      $('a.nav-trigger').addClass('project-open');
      $('div.container').addClass('project-open');
      break;
    case 'primary-nav':
      $('a.nav-trigger').addClass('nav-visible');
      resetClass();
      slideOut();
      break;
    default:
      $('.summary div.p_t').show();
      resetClass();
      break;
  }
};

page('*', main);
page({ hashbang: true });

$(() => {
  $('a.nav-trigger').on('click', () => {
    if (!$('a.nav-trigger').hasClass('project-open')) {
      $('a.nav-trigger').toggleClass('nav-visible');
      $('#primary-nav').toggleClass('nav-visible');
    }
  });

  $('#primary-nav ul li a').on('click', () => {
    if (!$('a.nav-trigger').hasClass('project-open')) {
      $('a.nav-trigger').toggleClass('nav-visible');
      $('#primary-nav').toggleClass('nav-visible');
    }
  });
});

module.exports = {
  slidingPanel: 'slidingPanel',
};
