# このソフトウェアについて #

GiHubApi.Repositories.Get.TwoFactor.201610210748は私個人が学習目的で作成したソフトウェアである。

自分のアカウント配下にあるリモートリポジトリの情報を取得するバッチ2版。

Two-factor認証にも一応対応。しかし、WinAuth.exeやpicl.exeが必要。
WinAuth.exeから得たOTPをGitHubAPIに渡す手順が自動化できていない。

認証方式|認証データ|専用バッチ
--------|----------|----------
認証なし|‐|SetCurlParamCaseNonAuth.bat
Basic認証|ユーザ名、パスワード|SetCurlParamCaseBasicAuth.bat
Two-factor認証|ユーザ名、パスワード、ワンタイムパスワード(OTP)|SetCurlParamCaseTwoFactorAuth.bat
OAuth(Token)認証|AccessToken|SetCurlParamCaseTokenAuth.bat

# 開発環境 #

* Windows XP Pro SP3 32bit
    * cmd.exe
* [curl.exe](https://curl.haxx.se/download.html#Win32)
    * 7.24.0
* [q.exe](http://harelba.github.io/q/ja/index.html)
    * 1.5.0
* [picl.exe](http://www.vector.co.jp/soft/winnt/util/se486615.html)
    * 1.1.0
* [WinAuth.exe](https://winauth.com/download/)
    * 3.5.1 (.NET 3.5) (2016-06-07)

## WebService ##

* [GitHub](https://github.com/)
    * [AccessToken](https://github.com/settings/tokens)
        * scopeに`repo`をチェックする
    * [Two-factor](https://github.com/settings/security)

## 準備

* あらかじめリポジトリを作成しておいてから、このバッチを実行する

認証方式ごとに以下の準備が必要。どれかひとつでいい。

* Basic認証、TwoFactor認証なら、Accounts.tsvファイルを用意する
* AccessToken認証なら、AccessToken.tsvファイルを用意する
* 認証しないなら、ファイルの用意は不要

## 実行

### 認証アカウントと認証方式の設定

1. `GiHubApi.Repository.Get.bat`をテキストエディタで開く
1. `GITHUB_USER`にユーザ名をセットし保存する
1. `call SetCurlParamCase～.bat`でどの認証を使うか設定する
1. `GiHubApi.Repository.Get.bat`ファイルを保存する

### 認証する

1. WinAuthを起動し、ワンタイムパスワード(OTP)を発行する
1. 30秒以内に`GiHubApi.Repository.Get.bat`をダブルクリックして実行する
1. jsonファイルができる
    * リポジトリデータが取得できていることを確認する

TwoFactor認証なら、上記のようなWinAuthとの連携が必要である。
WinAuthでOTPを発行するとクリップボードにコピーされるので、クリップボードを経由してOTPをAPIに渡す。

それ以外の認証方式ならバッチを実行するだけでいい。30秒縛りもない。

# ライセンス #

このソフトウェアはCC0ライセンスです。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
