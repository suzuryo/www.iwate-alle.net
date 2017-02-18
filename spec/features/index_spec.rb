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
    expect(page).to have_selector 'body#index > div.container > nav'
  end

  it 'has nav .summary ul li a classes' do
    expect(page).to have_selector 'body#index > div.container > nav > ul.summary > li.goal > a'
    expect(page).to have_selector 'body#index > div.container > nav > ul.summary > li.activities > a'
    expect(page).to have_selector 'body#index > div.container > nav > ul.summary > li.disaster > a'
    expect(page).to have_selector 'body#index > div.container > nav > ul.summary > li.network > a'
  end

  it 'has correct a href hash' do
    expect(page).to have_selector 'ul.summary > li.goal > a[href="#goal"]'
    expect(page).to have_selector 'ul.summary > li.activities > a[href="#activities"]'
    expect(page).to have_selector 'ul.summary > li.disaster > a[href="#disaster"]'
    expect(page).to have_selector 'ul.summary > li.network > a[href="#network"]'
  end

  it 'has a.goal div.p_t' do
    expect(page).to have_selector 'ul.summary > li.goal > a[href="#goal"]'
    within 'nav > ul.summary > li.goal > a > div.p_t' do
      expect(page).to have_selector 'h1', text: 'いわてアレルギーの会'
      expect(page).to have_selector 'p', text: '主な活動内容を紹介します'
    end
  end

  it 'has a.activities div.p_t' do
    expect(page).to have_selector 'ul.summary > li.activities > a[href="#activities"]'
    within 'nav > ul.summary > li.activities > a > div.p_t' do
      expect(page).to have_selector 'h1', text: '企画中の活動'
      expect(page).to have_selector 'p', text: '企画中の活動を紹介します'
    end
  end

  it 'has a.disaster div.p_t' do
    expect(page).to have_selector 'ul.summary > li.disaster > a[href="#disaster"]'
    within 'nav > ul.summary > li.disaster > a > div.p_t' do
      expect(page).to have_selector 'h1', text: '災害時の情報発信について'
      expect(page).to have_selector 'p', text: '『岩手アレルギー支援情報』 LINE@について'
    end
  end

  it 'has a.network div.p_t' do
    expect(page).to have_selector 'ul.summary > li.network > a[href="#network"]'
    within 'nav > ul.summary > li.network > a > div.p_t' do
      expect(page).to have_selector 'h1', text: '親の会ネットワーク'
      expect(page).to have_selector 'p', text: '岩手県内の親の会のご紹介'
    end
  end


  it 'has main article' do
    expect(page).to have_selector 'body#index > div.container > main[role=main] > article'
  end

  it 'has invisible article section' do
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.goal > section', visible:false
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.activities > section', visible:false
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.disaster > section', visible:false
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.network > section', visible:false
  end

  it 'has the article goal section' do
    within 'main[role=main] > article > ul.contents > li.goal > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: 'いわてアレルギーの会', visible:false
      expect(page).to have_selector 'p', text: '主な活動内容を紹介します', visible:false
    end

    within 'main[role=main] > article > ul.contents > li.goal > section', visible: false do
      expect(page).to have_selector 'h1', text: '主な活動内容', visible:false
      expect(page).to have_selector 'dl dt', visible:false
      expect(page).to have_selector 'dl dd', visible:false
    end
  end

  it 'has the article activities section' do
    within 'main[role=main] > article > ul.contents > li.activities > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: '企画中の活動', visible:false
      expect(page).to have_selector 'p', text: '企画中の活動を紹介します', visible:false
    end

    within 'main[role=main] > article > ul.contents > li.activities > section', visible: false do
      expect(page).to have_selector 'h1', text: '企画中の活動', visible:false
      expect(page).to have_selector 'dl dt', visible:false
      expect(page).to have_selector 'dl dd', visible:false
    end
  end

  it 'has the article disaster section' do
    within 'main[role=main] > article > ul.contents > li.disaster > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: '災害時の情報発信について', visible:false
      expect(page).to have_selector 'p', text: '『岩手アレルギー支援情報』 LINE@について', visible:false
    end

    within 'main[role=main] > article > ul.contents > li.disaster > section', visible: false do
      expect(page).to have_selector 'h1', text: '災害時の情報発信について', visible:false
      expect(page).to have_selector 'h2', text: '『岩手アレルギー支援情報』 LINE@について', visible:false
      expect(page).to have_selector 'ul li', visible:false
    end
  end

  it 'has the article network section' do
    within 'main[role=main] > article > ul.contents > li.network > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: '親の会ネットワーク', visible:false
      expect(page).to have_selector 'p', text: '岩手県内の親の会のご紹介', visible:false
    end

    within 'main[role=main] > article > ul.contents > li.network > section', visible: false do
      expect(page).to have_selector 'div > h1', visible:false
      expect(page).to have_selector 'div > div.url', visible:false
      expect(page).to have_selector 'div > div.mail', visible:false
    end
  end

  it 'has scroll button' do
    expect(page).to have_selector 'div.container > button.scroll', visible: false
  end

  it 'replace #line_at .line_at to #disaster .disaster' do
    expect(page).not_to have_selector 'ul.summary > li.line_at'
    expect(page).not_to have_selector 'ul.summary > li.line_at > a[href="#line_at"]'
    expect(page).not_to have_selector 'main[role=main] > article > ul.contents > li.line_at'
  end

end
