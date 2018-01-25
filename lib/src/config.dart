import 'dart:io';
import 'package:yaml/yaml.dart';
import 'server_config.dart';
import 'uid_config.dart';

class Config {
  ServerConfig _server;
  UIDConfig _uid;

  Config(String fileName) {
    try {
      if (fileName.split('.').last != 'yaml')
        throw new StateError('incorrect config extension!');

      Map config = loadYaml(new File(fileName).readAsStringSync());
      _server = new ServerConfig(config['server']);
      _uid = new UIDConfig(config['uid']);
    } on StateError catch (e) {
      print(e.runtimeType);
    } on FileSystemException catch (e) {
      print(e.runtimeType);
    }
  }

  get server => _server;
  get uid => _uid;
}
