# add-two

FlutterとAndroid SDKでの環境は整えてあること。
`cargo-ndk`はインストールされているNDKを使うらしい。  
`cargo-ndk`を使わなかった場合はビルド環境の標準`ld`が使われてプラットフォーム違いでエラーになる

```shell
$ cargo install cargo-ndk
$ rustup target add aarch64-linux-android
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
