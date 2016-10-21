:: GitHubAPIにてリポジトリ情報を取得する
:: 
:: 引数一覧
:: %1 ユーザ名
:: 
:: 注意
::   [リクエスト上限](https://developer.github.com/v3/#rate-limiting)
::     認証なしで行うと、1時間あたり60リクエストしかできない。
::     認証ありで行うと、1時間あたり5000リクエストまでできる。
::   [取得件数](https://developer.github.com/v3/#pagination)
::     per_pageの値 * 30。
::     per_page=1000なら、30000件のリポジトリ情報を取得できる。
@echo off

set Username=user1

set CURL_PEM="C:\Program Files\Git\ssl\certs\cacert.pem"
set SAVE_FILE="./GitHub.%Username%.Repositories.json"
set HDR_TIMEZONE="Time-Zone: Asia/Tokyo"

set API_URL_BASE=https://api.github.com
set API_PARAM="type=owner&sort=created&direction=desc&per_page=1000"

:: 変数を宣言しておく（CURL_PARAMを設定するバッチを呼び出す前に宣言することで呼出元で受け取れる）
set API_ENTRY_POINT=
set CURL_PARAM_AUTH=

:: 認証方式ごとにパラメータを設定する
::call SetCurlParamCaseNonAuth.bat %Username%
::call SetCurlParamCaseBasicAuth.bat %Username%
call SetCurlParamCaseTwoFactorAuth.bat %Username%
::call SetCurlParamCaseTokenAuth.bat %Username%

@echo on
curl -o %SAVE_FILE% --cacert %CURL_PEM% -H %HDR_TIMEZONE% %CURL_PARAM_AUTH% %API_URL_BASE%%API_ENTRY_POINT%%API_PARAM%
@echo off

pause
@echo on
