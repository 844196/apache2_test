# apache2_test

## Usage

```shell-session
$ vagrant up
```

## Descriptions

`cookbooks/apache/*`を参照せよ

### Vagrantfile

* タイムゾーンを日本へ変更
* aptリポジトリを日本のミラーサイトへ変更
* Ruby最新版取得用ppaを追加
* リポジトリ更新
* プロビジョニング用`ruby2.3`をインストール
* `itamae`をインストール
* プロビジョニング実行

### setup_apache.rb

* `apache2`のインストール
* `/etc/apache2/apache2.conf`を置き換え
    * コメントを日本語へ
    * `/`から`AllowOverride`を許可
    * `/usr/share`, `/var/www/html`ディレクティブを削除
* `000-default.conf`を無効化

### deploy_demopage.rb

実験中

* `vagrant`を`www-data`グループへ追加
* デモページを`/home/vagrant/webroot/index.php`へ配置
    * ディレクトリの所属グループを`www-data`へ変更
* デモページ用設定ファイルの配置、有効化
