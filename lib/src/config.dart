import 'dart:io';

import 'package:yaml/yaml.dart';

import 'server_config.dart';
import 'uid_config.dart';

/// Конфигуратор для сервиса генерации UID
class Config {
  /// Конфигурация для http сервера
  ServerConfig _server;

  /// Конфигурация для генератора
  UIDConfig _uid;

  /// Экземпляр класса конфигурации сервиса
  static Config _config;

  /// Возвращает единственный экземпляр класса [Config]
  static Config instance() {
    if (_config == null) _config = new Config._internal();
    return _config;
  }

  /// Внутренний конструктор
  Config._internal() {}

  /// Выполняет загрузку параметров из конфигурационного файла [fileName].
  ///
  /// Возвращает [_config] с установленными параметрами.
  Config load(String fileName) {
    try {
      var config = loadYaml(new File(fileName).readAsStringSync());
      if (config is Map) {
        _server = new ServerConfig(config['server']);
        _uid = new UIDConfig(config['uid']);
      } else
        throw (new FormatException(
            'Format of the loaded config is incorrect!'));
    } on FileSystemException catch (e) {
      print(e.runtimeType);
    } catch (e) {
      print(e.message);
    }
    return _config;
  }

  /// Если конфигурационный файл сервера не загружен или имеет некорректный формат,
  /// устанавливается конфигурация по умолчанию.
  get server => _server == null ? new ServerConfig() : _server;

  /// Если конфигурационный файл генератора не загружен или имеет некорректный формат,
  /// устанавливается конфигурация по умолчанию.
  get uid => _uid == null ? new UIDConfig() : _uid;
}
