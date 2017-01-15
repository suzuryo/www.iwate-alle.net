require 'spec_helper'

describe 'index', type: :feature do
  before do
    visit '/'
  end

  it 'has the correct title' do
    expect(page).to have_selector 'h1'
    within '.welcome > h1' do
      expect(page).to have_title '岩手県内の各地域のアレルギー患者の親の会「いわてアレルギーの会」'
    end
  end


  it 'has the correct header' do
    expect(page).to have_selector 'h1'
    within '.welcome > h1' do
      expect(page).to have_content 'いわてアレルギーの会'
    end
  end

  it 'has a article in there too' do
    expect(page).to have_selector 'article#article_index'
  end

  it 'has a body class' do
    expect(page).to have_selector 'body#index'
  end
end
