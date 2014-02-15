# encoding: utf-8

step 'PCまたはスマートフォンを利用している' do
  Capybara.current_driver = :smartphone
end

step ':careerのフィーチャーフォンを利用している' do |career|
  Capybara.current_driver = career.to_sym
end

step 'ポケドスにアクセスする' do
  Capybara.app_host = 'http://bus.capybala.com/'
end

step '画面に:labelボタンが表示されていること' do |label|
  expect(page).to have_link(label)
end

step '画面に:careerの絵文字が表示されていること' do |career|
  # copyright mark for each careers
  expected_contents = {
    docomo: "\ue731",
    au: '&#xE558;',
    softbank: "\ue24e",
  }
  expect(page).to have_content(expected_contents[career])
end

step ':labelボタンをクリックする' do |label|
  click_link label
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

step '画面に:textと表示されていること' do |text|
  expect(page).to have_content(text)
end
