# Hello, Cargo

Cargo : Rust のパッケージマネージャー をインストールします。

## Configuration

### Set Proxy

Windows: `%USERPROFILE%/.cargo/config.toml`

UNIX: `$HOME/.cargo/config.toml`

```toml:*/.cargo/config.toml
[http]
proxy = "http://192.0.2.0:24"
check-revoke = false
```

### Check Proxy

`cargo-update` をインストールして、proxy を通るか確認する。

```sh
cargo install cargo-update
```

## 参考

- [Configuration - The Cargo Book](https://doc.rust-lang.org/cargo/reference/config.html)

## Tags

`#cargo, #proxy`
