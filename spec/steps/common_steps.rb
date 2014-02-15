# encoding: utf-8

step 'PCまたはスマートフォンを利用している' do
  Capybara.current_driver = :smartphone
end

step 'ポケドスにアクセスする' do
  Capybara.app_host = 'http://bus.capybala.com/'
end

