import 'package:get_storage/get_storage.dart';

class TLocalStorage{
  static final TLocalStorage _instance = TLocalStorage._internal();
  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();
  final GetStorage _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic Method to Read Data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic Method to Remove Data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Generic Method to Clear All Data
  Future<void> clearAllData() async {
    await _storage.erase();
  }

}