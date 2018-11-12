# bin
Travis CI で利用する実行ファイル置き場

# codesniffer
PHP コード規約

# Travis CI
プロジェクトごとにSSH Keyの設定が必須

## 必須の環境変数

### Travis CI Settings
 - GITHUB_ACCOUNT: Githubでコメントを残すユーザのアカウント
 - GITHUB_TOKEN: GithubのアカウントのAPIトークン

### .travis.yml
 - TRAVIS_SDK_DIR: aucfan-sdkをcloneする先
