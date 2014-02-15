# encoding: utf-8

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
