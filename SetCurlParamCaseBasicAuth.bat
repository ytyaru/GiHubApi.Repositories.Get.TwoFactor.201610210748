:: Basic認証でリポジトリ情報を取得するときのcURLのパラメータを設定する。
:: 
:: 引数一覧
:: %1 ユーザ名
:: 
:: 出力変数一覧（呼出元で以下の名前の変数を用意しておくこと）
::   API_ENTRY_POINT
::   CURL_PARAM_AUTH
set Username=%1
set Password=

:: パスワードをTSVファイルから取得する
:: http://harelba.github.io/q/ja/index.html
set q="C:\root\tool\System\q-1.5.0\bin\q.bat"
set TSV_TOKEN=Accounts.tsv
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Password from %TSV_TOKEN% where Username == '%Username%'"`) DO set Password=%%i

set API_ENTRY_POINT=/user/repos?
set CURL_PARAM_AUTH= -u "%Username%:%Password%"
