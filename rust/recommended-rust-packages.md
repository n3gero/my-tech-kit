# Recommended Rust Packages

パッケージの導入方法

```sh
cargo install $PACKAGE_NAME

# like this,
cargo install cargo-update
```

## Packages

### [cargo-update](https://crates.io/crates/cargo-update)

すべての依存関係を更新する。

```sh
cargo update
```

### [mdbook](https://crates.io/crates/mdbook)

```sh
# 新規作成
mdbook init $PATH_TO_STORE_MDBOOK

cd $PATH_TO_STORE_MDBOOK

# ビルドしてブラウザで展開
mdbook build --open

# ライブプレビュー (http://localhost:3000)
# Note: ホットリロードのためのコマンド。Web サイト用の HTTP サーバーを意図していない。
mdbook serve
```

[rust-lang.github.io/mdBook/](https://rust-lang.github.io/mdBook/)

#### [mdbook-mermaid](https://crates.io/crates/mdbook-mermaid)

図(svg)を作成できる。

```mermaid
graph TD;
    foo-->bar;
```

```sh
cd $PATH_TO_STORE_MDBOOK
mdbook-mermaid install

# or

mdbook-mermaid install $PATH_TO_STORE_MDBOOK
```

book.toml に以下を追記。

```toml
[preprocessor.mermaid]
command = "mdbook-mermaid"

[output.html]
additional-js = ["mermaid.min.js", "mermaid-init.js"]
```

[mermaid.js.org](https://mermaid.js.org/)\

## Tags

`cargo`
