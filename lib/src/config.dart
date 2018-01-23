import 'dart:io';
import 'package:yaml/yaml.dart';
import 'server_config.dart';
import 'uid_config.dart';

class Config {
	ServerConfig _server;
	UIDConfig _uid;

  Config(String filePath) {
    Map config = _loadYamlFileSync(filePath);
		_server = new ServerConfig(config['server']);
		_uid = new UIDConfig(config['uid']);
  }

  Map _loadYamlFileSync(String path) {
    File file = new File(path);
    String content = file.readAsStringSync();
    return loadYaml(content);
  }

	get server => _server;
	get uid => _uid;
}
