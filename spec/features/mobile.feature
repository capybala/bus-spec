# encoding: utf-8
# language: ja

機能: バス停を検索
	シナリオ: トップページにアクセスして検索する
		前提サイトにアクセスする
		前提"京都市役所"に居る
		もしトップページを表示する
		ならば画面に近くのバス停を探すボタンが表示されていること
		もしバス停を探すボタンをクリックする
		ならば画面に"この近くのバス停"と表示されていること
		かつ画面に"京都市役所前: 91m"と表示されていること
		かつ画面に"河原町三条: 155m"と表示されていること

	シナリオ: Geolocationがサポートされていないブラウザで検索する
		前提サイトにアクセスする
		もしトップページを表示する
		かつバス停を探すボタンをクリックする
		ならば画面に"ご利用のブラウザでは現在地を取得できないようです。"と表示されていること