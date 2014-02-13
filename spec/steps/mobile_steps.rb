# encoding: utf-8

step 'サイトにアクセスする' do
  Capybara.current_driver = :webkit
  Capybara.app_host = 'http://bus.capybala.com/'
  Capybara.run_server = false
end

step 'トップページを表示する' do
  visit '/'
end

step '画面に近くのバス停を探すボタンが表示されていること' do
  expect(page).to have_xpath('id("btn")')
end
