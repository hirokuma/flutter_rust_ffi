# rust_ffi_android

FFIおためし

## Android版

* `git clone https://github.com/hirokuma/flutter_rust_ffi.git`
* `cd flutter_rust_ffi`
* `flutter pub get`
* `./rust/add-two`のREADMEを見ながらAndroid用共有ライブラリを配置
* `flutter run`
* 起動時に`add(123, 456)`を呼び出して結果を出力している。

### Rust

#### ビルド関係

[flutter_rust_bridge](https://cjycode.com/flutter_rust_bridge/quickstart)のインストール。

```shell
$ cargo install flutter_rust_bridge_codegen
$ flutter_rust_bridge_codegen --version
flutter_rust_bridge_codegen 2.13.0
```

以下は普通のFFIをビルドしたときに追加したもので、今回必要かどうかわからない。

```shell
$ cargo install cargo-ndk
$ cargo ndk --version
cargo-ndk 4.1.2
$ rustup target add aarch64-linux-android
```

#### flutter_rust_bridge

このリポジトリでは実行済みなので実行しないこと！  
プロジェクトのトップディレクトリで実行するとファイルが作られるし、
既存の`lib/main.dart`は上書きされる([Directory structure](https://cjycode.com/flutter_rust_bridge/guides/miscellaneous/directory))。

```shell
$ flutter_rust_bridge_codegen integrate
```

トップディレクトリに`rust/`が作られて`src/`なども配置される。
今回は`rust/src/api/add.rs`を追加し、`mod.rs`で参照を追加している。

bindingの生成`generate`はRustのコードが変更されたら実行する。

```shell
$ flutter_rust_bridge_codegen generate
```
