# encoding: utf-8

step 'サイトにアクセスする' do
  Capybara.current_driver = :webkit
  Capybara.app_host = 'http://bus.capybala.com/'
  Capybara.run_server = false
end

step ':placeに居る' do |place|
  case place
  when '京都市役所'
    @place = {lat: 35.01129870069897, lng: 135.76807713296512}
  else
    raise "Unknown place"
  end
end

step 'トップページを表示する' do
  visit '/'
  simulate_location(@place[:lat], @place[:lng]) if @place
end

step '画面に近くのバス停を探すボタンが表示されていること' do
  expect(page).to have_link('近くのバス停を探す')
end

step 'バス停を探すボタンをクリックする' do
  click_link '近くのバス停を探す'
end

step '画面に:textと表示されていること' do |text|
  expect(page).to have_content(text)
end
