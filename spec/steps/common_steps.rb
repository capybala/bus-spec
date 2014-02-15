# encoding: utf-8

step 'PCまたはスマートフォンを利用している' do
  Capybara.current_driver = :smartphone
end

step 'ポケドスにアクセスする' do
  Capybara.app_host = 'http://bus.capybala.com/'
end

step '画面に:labelボタンが表示されていること' do |label|
  expect(page).to have_link(label)
end

step ':labelボタンをクリックする' do |label|
  click_link label
end

