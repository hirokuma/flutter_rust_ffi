import 'dart:ffi' as ffi;

typedef NativeAdd = ffi.Int64 Function(ffi.Int64, ffi.Int64);
typedef DartAdd = int Function(int, int);

class RustApi {
  static final ffi.DynamicLibrary _lib = ffi.DynamicLibrary.open('libffi.so');

  static final DartAdd add = _lib.lookupFunction<NativeAdd, DartAdd>('my_add');
}
