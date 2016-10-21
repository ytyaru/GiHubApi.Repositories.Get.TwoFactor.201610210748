:: AccessToken認証でリポジトリ情報を取得するときのcURLのパラメータを設定する。
:: 
:: 引数一覧
:: %1 Username
:: 
:: 出力変数一覧（呼出元で以下の名前の変数を用意しておくこと）
::   API_ENTRY_POINT
::   CURL_PARAM_AUTH
:: 注意
::   [scope](https://developer.github.com/v3/oauth/#scopes)
::     AccessTokenのscopeには`repo`を付与すること。
set Username=%1

:: TSVファイルからAccessTokenを取得する
::   scopeはcsv形式なので、その中にrepoが含まれているか判定するのはむずかしそう。
::   だからTokenDescriptionで絞り込むことにした。
set q="C:\root\tool\System\q-1.5.0\bin\q.bat"
set TSV_TOKEN=AccessToken.tsv
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Token from %TSV_TOKEN% where User == '%Username%' and Description == '%TokenDescription%'"`) DO set AccessToken=%%i

set API_ENTRY_POINT=/user/repos?
set CURL_PARAM_AUTH= -H "Authorization: token %AccessToken%"
