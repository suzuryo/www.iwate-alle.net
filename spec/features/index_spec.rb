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

  it 'has nav .summary' do
    expect(page).to have_selector 'body#index > nav.summary'
  end

  it 'has nav .summary ul li a classes' do
    expect(page).to have_selector 'body#index > nav.summary > ul > li > a.goal'
    expect(page).to have_selector 'body#index > nav.summary > ul > li > a.activities'
    expect(page).to have_selector 'body#index > nav.summary > ul > li > a.line_at'
    expect(page).to have_selector 'body#index > nav.summary > ul > li > a.network'
  end

  it 'has a.goal div.p_t' do
    expect(page).to have_selector 'ul > li > a.goal[href="#goal"]'
    within 'nav.summary > ul > li > a.goal > div.p_t' do
      expect(page).to have_selector 'h1', text: 'いわてアレルギーの会'
      expect(page).to have_selector 'p', text: '主な活動内容を紹介します'
    end
  end

  it 'has a.activities div.p_t' do
    expect(page).to have_selector 'ul > li > a.activities[href="#activities"]'
    within 'nav.summary > ul > li > a.activities > div.p_t' do
      expect(page).to have_selector 'h1', text: '企画中の活動'
      expect(page).to have_selector 'p', text: '企画中の活動を紹介します'
    end
  end

  it 'has a.line_at div.p_t' do
    expect(page).to have_selector 'ul > li > a.line_at[href="#line_at"]'
    within 'nav.summary > ul > li > a.line_at > div.p_t' do
      expect(page).to have_selector 'h1', text: '『岩手アレルギー支援情報』 LINE@について'
      expect(page).to have_selector 'p', text: '災害時の情報発信について'
    end
  end

  it 'has a.network div.p_t' do
    expect(page).to have_selector 'ul > li > a.network[href="#network"]'
    within 'nav.summary > ul > li > a.network > div.p_t' do
      expect(page).to have_selector 'h1', text: '親の会ネットワーク'
      expect(page).to have_selector 'p', text: '岩手県内の親の会のご紹介'
    end
  end


  it 'has main article' do
    expect(page).to have_selector 'body#index main[role=main] > article.contents'
  end

  it 'has invisible article section' do
    expect(page).to have_selector 'main[role=main] > article.contents > section.goal', visible:false
    expect(page).to have_selector 'main[role=main] > article.contents > section.activities', visible:false
    expect(page).to have_selector 'main[role=main] > article.contents > section.line_at', visible:false
    expect(page).to have_selector 'main[role=main] > article.contents > section.network', visible:false
  end

  it 'has the article goal section' do
    within 'main[role=main] > article.contents > section.goal', visible: false do
      expect(page).to have_selector 'h1', text: '主な活動内容', visible:false
      expect(page).to have_selector 'dl dt', visible:false
      expect(page).to have_selector 'dl dd', visible:false
    end
  end

  it 'has the article activities section' do
    within 'main[role=main] > article.contents > section.activities', visible: false do
      expect(page).to have_selector 'h1', text: '企画中の活動', visible:false
      expect(page).to have_selector 'dl dt', visible:false
      expect(page).to have_selector 'dl dd', visible:false
    end
  end

  it 'has the article line_at section' do
    within 'main[role=main] > article.contents > section.line_at', visible: false do
      expect(page).to have_selector 'h1', text: '『岩手アレルギー支援情報』LINE@について', visible:false
      expect(page).to have_selector 'ul li', visible:false
    end
  end

  it 'has the article network section' do
    within 'main[role=main] > article.contents > section.network', visible: false do
      expect(page).to have_selector 'div > h1', visible:false
      expect(page).to have_selector 'div > div.url', visible:false
      expect(page).to have_selector 'div > div.mail', visible:false
    end
  end

end
