# encoding: utf-8

step 'PCまたはスマートフォンを利用している' do
  set_user_agent(:iphone)
end

step 'ポケドスにアクセスする' do
  Capybara.app_host = 'http://bus.capybala.com/'
end

