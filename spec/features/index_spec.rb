# frozen_string_literal: true

require 'spec_helper'

describe 'index', type: :feature, js: true do
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
      expect(page).to have_selector 'h1', text: '活動内容'
      expect(page).to have_selector 'p', text: '実施中の活動を紹介します'
    end
  end

  it 'has a.disaster div.p_t' do
    expect(page).to have_selector 'ul.summary > li.disaster > a[href="#disaster"]'
    within 'nav > ul.summary > li.disaster > a > div.p_t' do
      expect(page).to have_selector 'h1', text: '災害発生時のアレルギー対応支援'
      expect(page).to have_selector 'p', text: "災害に備えてアレルギー支援体制を\n整えています"
    end
  end

  it 'has a.network div.p_t' do
    expect(page).to have_selector 'ul.summary > li.network > a[href="#network"]'
    within 'nav > ul.summary > li.network > a > div.p_t' do
      expect(page).to have_selector 'h1', text: 'お役立ち情報'
      expect(page).to have_selector 'p', text: '岩手県内のアレルギー情報について'
    end
  end

  it 'has main article' do
    expect(page).to have_selector 'body#index > div.container > main[role=main] > article'
  end

  it 'has invisible article section' do
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.goal > section', visible: false
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.activities > section', visible: false
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.disaster > section', visible: false
    expect(page).to have_selector 'main[role=main] > article > ul.contents > li.network > section', visible: false
  end

  it 'has the article goal section' do
    within 'main[role=main] > article > ul.contents > li.goal > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: 'いわてアレルギーの会', visible: false
      expect(page).to have_selector 'p', text: '主な活動内容を紹介します', visible: false
    end

    within 'main[role=main] > article > ul.contents > li.goal > section > div.contents-goal', visible: false do
      expect(page).to have_selector 'h1', text: '活動目的', visible: false
      expect(page).to have_selector 'h1', text: '発足の経緯', visible: false
      expect(page).to have_selector 'h1', text: 'いわてアレルギーの会とは', visible: false
      expect(page).to have_selector 'h1', text: '主な活動内容', visible: false
      expect(page).to have_selector 'h1', text: '助成金', visible: false
      expect(page).to have_selector 'h1', text: '活動報告', visible: false
      expect(page).to have_selector 'h1', text: '連絡先', visible: false
      expect(page).to have_selector 'h2', text: 'いわてアレルギーの会', visible: false
    end

    within 'div.contents-goal address', visible: false do
      expect(page).to have_selector 'dt', text: 'MAIL', visible: false
      # expect(page).to have_selector 'dd', text: 'mail@iwate-alle.net', visible: false
      expect(page).to have_selector 'dt', text: 'URL', visible: false
      expect(page).to have_selector 'dd', text: 'http://www.iwate-alle.net', visible: false
      expect(page).to have_selector 'dt', text: 'Facebook', visible: false
      expect(page).to have_selector 'dd', text: 'https://www.facebook.com/allergy.iwate/', visible: false
    end
  end

  it 'has the article activities section' do
    within 'main[role=main] > article > ul.contents > li.activities > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: '活動内容', visible: false
      expect(page).to have_selector 'p', text: '実施中の活動を紹介します', visible: false
    end

    within 'main[role=main] > article > ul.contents > li.activities > section > div.contents-activities', visible: false do
      expect(page).not_to have_selector 'h1', text: 'ALサインプレートの普及啓発', visible: false

      expect(page).to have_selector 'h1', text: '食物アレルギー勉強会', visible: false
      expect(page).to have_selector 'dl dt', text: '目的', visible: false
      expect(page).to have_selector 'dl dt', text: '活動内容', visible: false

      expect(page).to have_selector 'h1', text: 'アレルギー支援体制の周知', visible: false
      expect(page).to have_selector 'dl dt', text: '目的', visible: false
      expect(page).to have_selector 'dl dt', text: '活動内容', visible: false

      expect(page).to have_selector 'h1', text: '食物アレルギーサインプレートを作成', visible: false
      expect(page).to have_selector 'dl dt', text: '目的', visible: false
      expect(page).to have_selector 'dl dt', text: '活動内容', visible: false
      expect(page).to have_selector 'dl dt', text: 'サインプレートセット内容', visible: false
      expect(page).to have_selector 'dl dd a[href="https://readyfor.jp/projects/17713"]', text: 'https://readyfor.jp/projects/17713', visible: false
    end
  end

  it 'has the article disaster section' do
    within 'main[role=main] > article > ul.contents > li.disaster > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: '災害発生時のアレルギー対応支援', visible: false
      expect(page).to have_selector 'p', text: '災害に備えてアレルギー支援体制を整えています', visible: false
    end

    within 'main[role=main] > article > ul.contents > li.disaster > section > div.contents-disaster', visible: false do
      expect(page).to have_selector 'h1', text: '災害時の情報発信', visible: false
      expect(page).to have_selector 'h1', text: '登録方法', visible: false
      expect(page).to have_selector 'h1', text: '発信する情報', visible: false
      expect(page).to have_selector 'h1', text: '支援物資', visible: false
      expect(page).to have_selector 'h1', text: '岩手のアレルギー対応支援体制', visible: false
    end
  end

  it 'has the article network section' do
    within 'main[role=main] > article > ul.contents > li.network > div.preview', visible: false do
      expect(page).to have_selector 'h1', text: 'お役立ち情報', visible: false
      expect(page).to have_selector 'p', text: '岩手県内のアレルギー情報について', visible: false
    end

    within 'main[role=main] > article > ul.contents > li.network > section > div.contents-network', visible: false do
      expect(page).to have_selector 'h1', text: '岩手県内の親の会', visible: false
      expect(page).to have_selector 'dl dt', text: '盛岡アレルギーっ子サークル「ミルク」', visible: false
      expect(page).to have_selector 'dl dd', text: 'http://allergy.morioka.co', visible: false
      expect(page).to have_selector 'dl dt', text: 'アレルギーケア.くじ', visible: false
      expect(page).to have_selector 'dl dd', text: 'http://allecare.jimdo.com', visible: false
      expect(page).to have_selector 'dl dt', text: 'アレルギーフレンズ☆おうしゅう', visible: false
      expect(page).to have_selector 'dl dd', text: 'http://ameblo.jp/friends-ooo/', visible: false
      expect(page).to have_selector 'dl dt', text: 'アレルっ子かまいし', visible: false
      expect(page).to have_selector 'dl dd', text: 'http://ameblo.jp/alle-kamaishi/', visible: false
      expect(page).to have_selector 'dl dt', text: '大船渡アレルギーサポートゆずっ子', visible: false
      expect(page).to have_selector 'dl dd', text: 'http://ameblo.jp/ofunato-yuzu', visible: false

      expect(page).not_to have_selector 'h1', text: 'ALサインプレート配布施設', visible: false

      expect(page).to have_selector 'h1', text: '負荷試験実施施設', visible: false
      expect(page).to have_selector 'dl dd ul li', text: 'もりおかこども病院', visible: false
      expect(page).to have_selector 'dl dd ul li', text: '岩手医科大学病院', visible: false
      expect(page).to have_selector 'dl dd ul li', text: '県立久慈病院', visible: false
      expect(page).to have_selector 'dl dd ul li', text: '県立大船渡病院', visible: false
    end
  end

  it 'has scroll button' do
    expect(page).to have_selector 'div.container > button.scroll', visible: false
  end

  it 'has the primary nav' do
    within 'nav#primary-nav ul', visible: false do
      expect(page).to have_selector 'li a[href="#goal"]', text: 'いわてアレルギーの会', visible: false
      expect(page).to have_selector 'li a[href="#activities"]', text: '活動内容', visible: false
      expect(page).to have_selector 'li a[href="#disaster"]', text: '災害発生時のアレルギー対応支援', visible: false
      expect(page).to have_selector 'li a[href="#network"]', text: 'お役立ち情報', visible: false
    end
  end

  it 'replace #line_at .line_at to #disaster .disaster' do
    expect(page).not_to have_selector 'ul.summary > li.line_at'
    expect(page).not_to have_selector 'ul.summary > li.line_at > a[href="#line_at"]'
    expect(page).not_to have_selector 'main[role=main] > article > ul.contents > li.line_at'
  end

  it 'have no typo' do
    expect(page).to have_selector('div.contents-goal p:nth-of-type(4)', text: '分からない', visible: false)
    expect(page).not_to have_selector('div.contents-goal p:nth-of-type(4)', text: 'わらかない', visible: false)
  end
end
