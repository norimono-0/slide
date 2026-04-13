# スライドショー セットアップ手順書（Mac）

この手順書は **Mac 環境** でスライドショーを初めて利用する方向けです。  
上から順に実施することで、ローカル確認 → GitHub Pages 公開まで完了します。

---

## 前提条件

以下がインストールされていることを確認してください。

### Git

ターミナルを開いて以下を実行し、バージョンが表示されれば OK です。

```bash
git --version
```

インストールされていない場合：

```bash
# Homebrew 経由（推奨）
brew install git

# または Xcode Command Line Tools
xcode-select --install
```

> Homebrew 自体が未インストールの場合は https://brew.sh から導入してください。

### Web ブラウザ

Safari / Chrome / Firefox いずれかが使えれば問題ありません。

---

## STEP 1 ： リポジトリをクローンする

ターミナルで作業ディレクトリに移動してからクローンします。

```bash
cd ~/Documents    # 任意の場所でOK
git clone https://github.com/<ユーザー名>/<リポジトリ名>.git
cd <リポジトリ名>
```

> クローン後、`ls` を実行して `index.html` や `generate-list.sh` があれば成功です。

---

## STEP 2 ： 画像を追加する

1. Finder でクローンしたフォルダを開く
2. `images/` フォルダを開く
3. 表示したい画像ファイルをコピーして貼り付ける

**対応形式：** `jpg` / `jpeg` / `png` / `gif` / `webp` / `bmp`

> ファイル名に日本語・スペースが含まれていても動作しますが、  
> 英数字とアンダースコアのみ（例：`photo_001.jpg`）が安全です。

---

## STEP 3 ： 画像リストを生成する

ターミナルでリポジトリのフォルダにいる状態で以下を実行します。

```bash
sh generate-list.sh
```

以下のような出力が表示されれば成功です。

```
images-list.js を生成中...
Done: XX image(s) written to images-list.js
```

> `images-list.js` が更新されます。このファイルは自動生成のため直接編集しないでください。

**「Permission denied」と表示された場合：**

```bash
chmod +x generate-list.sh
sh generate-list.sh
```

---

## STEP 4 ： ブラウザで動作確認する

以下のいずれかの方法で `index.html` をブラウザで開きます。

**方法 A：ターミナルから開く**

```bash
open index.html
```

**方法 B：Finder から開く**

1. Finder でクローンしたフォルダを開く
2. `index.html` をダブルクリックする

**確認ポイント：**
- 画像が表示されてフェードで切り替わる
- 画面下部にコントロールバーが表示される（マウスを動かすと出てくる）
- 左下のカウンターに `1 / XX` と枚数が表示される

**画像が表示されない場合：**
- `images/` フォルダに画像が入っているか確認する
- STEP 3 を再度実施して `images-list.js` が更新されているか確認する
- ブラウザを再読み込み（`Cmd + R`）する

---

## 画像を追加・更新するとき（2回目以降）

```bash
# 1. images/ に画像ファイルを追加（Finder でコピー）

# 2. リスト再生成
sh generate-list.sh

# 3. ブラウザで確認
open index.html
```

---

## 操作方法

| 操作 | 動作 |
|---|---|
| スペースキー | 一時停止 / 再開 |
| ⏸ / ▶ ボタン | 一時停止 / 再開 |
| ⛶ ボタン | フルスクリーン切り替え |
| 進捗バークリック | その位置の画像にジャンプ |
| マウスを動かす | コントロールバーを表示 |
