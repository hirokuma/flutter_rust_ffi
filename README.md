# rust_ffi_android

FFIおためし

## Android版

* `git clone https://github.com/hirokuma/flutter_rust_ffi.git`
* `cd flutter_rust_ffi`
* `flutter pub get`
* `./rust/add-two`のREADMEを見ながらAndroid用共有ライブラリを配置
* `flutter run`
* カウンターじゃない方のボタンをクリックすると`my_add`を呼び出して結果をボタンに貼る

### Rust

#### ビルド関係

flutter_rust_bridgeのインストール。

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

このリポジトリでは実行済みなので実行しないこと。
プロジェクトのトップディレクトリで実行するとファイルが作られるし、
既存の`lib/main.dart`は上書きされる。

```shell
$ flutter_rust_bridge_codegen integrate
```

トップディレクトリに`rust/`が作られて`src/`なども配置される。
今回は`rust/src/api/add.rs`を追加し、`mod.rs`で参照を追加している。

bindingの生成`generate`はRustのコードが変更されたら実行する。

```shell
$ flutter_rust_bridge_codegen generate
```


```shell
$ cargo ndk -t arm64-v8a build --release -p ffi
$ ls target/aarch64-linux-android/release/lib*.so
target/aarch64-linux-android/release/libffi.so
$ nm target/aarch64-linux-android/release/libffi.so | grep " T "
0000000000011d5c T my_add
```

```shell
$ mkdir -p ../../android/app/src/main/jniLibs/arm64-v8a
$ cp target/aarch64-linux-android/release/libffi.so ../../android/app/src/main/jniLibs/arm64-v8a/
```

