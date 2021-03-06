-------------------------------------------------------------------
--
-- HSFramework(Hana Saurus Framework)
-- Makoto
-- Version:0.4.2
-- MOAI SDK:Moai SDK Beta Version 0.95 Beta revesion 3
-- Notes:
-- Does not work when you do not to download and compile the source
-- from github in MacOSX.
-------------------------------------------------------------------

[日本語]
HSFrameworkは、MoaiSDK(http://getmoai.com/moai/moai-sdk)
で開発を簡単にするためのフレームワークです。

MoaiSDKは低レベル層なフレームワークの為、そのまま使用すると少し面倒ですが、
このフレームワークを使用する事で、簡単に開発できるようにする事が目標です。

その他、以下の点を目標として作成しています。

・2Dオブジェクトを簡単に作成
・完全なシーングラフの構築、シーン遷移の管理
・異なるデバイスサイズに対応する為のロジック
・簡単に使用できる複雑なアニメーション
・マルチバイト文字のテキスト描画を簡単にできるようにする
・タイルマップ形式(tmx)のファイル読み込み、マップ構築
・物理オブジェクトを簡単に使用（一部実装した。あとちょっと）
・GUI機能(未実装)

ソースはApache License 2.0の元で公開しますので、自由に使用していいです。
導入する場合、以下の手順でフレームワークを導入してください。

1.以下のページから、MoaiSDKをダウンロードして導入してください。

http://getmoai.com/moai/moai-sdk

2.HSFrameworkをダウンロードして、任意のディレクトリにコピーしてください。

3.Windowsの場合は以下の環境変数を設定してください。

MOAI_BIN=Windowsの実行バイナリのフォルダパスを設定してください。
MOAI_CONFIG=MoaiSDKのsamplesフォルダのconfig.luaのフォルダパスを設定してください。

4.MacOSXの場合は、以下の環境変数を設定してください。

MOAI_HOME=MoaiSDKのトップディレクトリを設定してください。

注意事項：
MacOSXの場合、以下の「Moai SDK Beta Version 0.95 Beta revesion 3」で動作しません。
最新のソースをgithubからダウンロードして、xcodeでコンパイルして対応してください。

5.Windowsの場合は "run.bat"、MacOSXの場合は"run.sh"を実行してサンプルを実行してください。
 後は、サンプルを見てあなたのゲームを作成してください。

[English]
when -- it is -- moreover 