# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

画像（150枚想定）を自動再生し続けるスライドショー。サーバー不要で `index.html` をブラウザで直接開くだけで動作する。ローカル専用。`images/` は `.gitignore` に含まれており Git 管理対象外。

## ファイル構成と役割

- **`index.html`** — スライドショー本体。CSS・JS をインラインで完結（外部ライブラリなし）。`images-list.js` を `<script src>` で読み込む。
- **`images-list.js`** — `const IMAGES = [...]` を定義するだけの自動生成ファイル。**直接編集しない**。
- **`generate-list.bat`** — Windows 用。内部で `generate-list.ps1` を呼び出して `images-list.js` を生成する。
- **`generate-list.ps1`** — 実際のスキャン・書き込み処理（bat から呼ばれる）。
- **`generate-list.sh`** — Mac / Linux 用。直接 `images-list.js` を生成する。
- **`images/`** — 画像ファイルの置き場所。対応形式: `jpg / jpeg / png / gif / webp / bmp`。**.gitignore に含まれ Git 管理対象外**。

## アーキテクチャ

`index.html` 内のスクリプトは IIFE で完結。主要な仕組み：

- **ダブルバッファ描画** — `#img-a` と `#img-b` の2枚の `<img>` を重ね、CSS `opacity` トランジションで交互にフェード切り替えする（`activeImg` / `inactiveImg` を swap）。
- **画像リスト** — `images-list.js` が `const IMAGES = [...]` を定義。スクリプト側は `typeof IMAGES !== 'undefined'` でガードしてから参照する（ファイルが存在しない場合でもエラーにならない）。
- **タイマー** — `setInterval(next, 3000)` で自動送り。一時停止は `clearInterval`、再開は再セット。
- **コントロールバー** — マウス移動・タッチで表示し、2.5秒後に自動非表示（一時停止中は維持）。

## 設計上の制約

- `file://` プロトコルで直接動作すること（ローカルサーバー不要）が要件。fetch / XHR は使わない。
- `images-list.js` はスクリプトが生成するため、`index.html` からは `typeof` ガードで参照すること。
- 外部ライブラリを追加しない（依存ゼロが保守性の核心）。
