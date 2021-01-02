import $ from 'jquery';

const c = (t) => {
  let s = '';
  let m = '';
  for (let i = 0; i < t.length; i += 1) {
    m = t.charCodeAt(i);
    s += String.fromCharCode(m + 1);
  }
  return s;
};

const es = c(String.fromCharCode(108, 96, 104, 107, 63, 104, 118, 96, 115, 100) + String.fromCharCode(44, 96, 107, 107, 100, 45, 109, 100, 115));

const mailText = `<a href="mailto:${es}">${es}</a>`;

$(() => {
  $('.iwate_alle_mail').append(mailText);
});
