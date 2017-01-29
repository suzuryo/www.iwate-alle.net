require 'spec_helper'

describe 'index', type: :feature do
  before do
    visit '/'
  end

  it 'has the correct title' do
    expect(page).to have_title '岩手県内の各地域のアレルギー患者の親の会「いわてアレルギーの会」'
  end

  it 'has a body class' do
    expect(page).to have_selector 'body#index'
  end

  it 'has the correct header' do
    within 'header > h1' do
      expect(page).to have_content 'いわてアレルギーの会'
    end
  end

  it 'has main article' do
    expect(page).to have_selector 'main[role=main] > article'
  end

  it 'has the #welcome section' do
    within 'main[role=main] > article > section#welcome' do
      expect(page).to have_selector 'h1', text: 'いわてアレルギーの会'
      expect(page).to have_selector 'h2', text: 'アレルギーっ子が安心して生活できる社会を'
      expect(page).to have_selector 'p'
    end
  end

  it 'has the #goal section' do
    within 'main[role=main] > article > section#goal' do
      expect(page).to have_selector 'h1', text: '主な活動内容'
      expect(page).to have_selector 'dl dt'
      expect(page).to have_selector 'dl dd'
    end
  end

  it 'has the #activities section' do
    within 'main[role=main] > article > section#activities' do
      expect(page).to have_selector 'h1', text: '企画中の活動'
      expect(page).to have_selector 'dl dt'
      expect(page).to have_selector 'dl dd'
    end
  end

  it 'has the #line_at section' do
    within 'main[role=main] > article > section#line_at' do
      expect(page).to have_selector 'h1', '『岩手アレルギー支援情報』LINE@について'
      expect(page).to have_selector 'ul li'
    end
  end

  it 'has the #network section' do
    within 'main[role=main] > article > section#network' do
      expect(page).to have_selector 'div > h1'
      expect(page).to have_selector 'div > div.url'
      expect(page).to have_selector 'div > div.mail'
    end
  end

end
