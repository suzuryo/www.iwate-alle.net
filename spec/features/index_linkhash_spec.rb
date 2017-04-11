# frozen_string_literal: true

require 'spec_helper'

describe 'index', type: :feature do
  before do
    visit '/'
  end

  it 'has the correct classes' do
    expect(page).to have_selector 'body#index div.container'

    expect(page).to have_selector 'a.nav-trigger'

    expect(page).to have_selector 'div.container ul.summary li.goal'
    expect(page).to have_selector 'div.container ul.summary li.activities'
    expect(page).to have_selector 'div.container ul.summary li.disaster'
    expect(page).to have_selector 'div.container ul.summary li.network'

    expect(page).to have_selector 'div.container ul.contents li#goal.goal', visible: false
    expect(page).to have_selector 'div.container ul.contents li#activities.activities', visible: false
    expect(page).to have_selector 'div.container ul.contents li#disaster.disaster', visible: false
    expect(page).to have_selector 'div.container ul.contents li#network.network', visible: false

    expect(page).to have_selector 'nav#primary-nav', visible: false
  end
end
