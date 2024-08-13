import '../../common.dart';

abstract class BaseStorageService {
  Future<bool> containsKey(StorageKeys key);
  Future<void> remove(StorageKeys key);
  Future<String?> get(StorageKeys key);
  Future<void> save({required StorageKeys key, required String value});
  Future<void> erase();
  Future<String?> getCurrentTheme();
  Future<void> switchTheme(bool value);
}
