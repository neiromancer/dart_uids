import 'dart:io';
import 'package:yaml/yaml.dart';

// prototype
class Configurator {
  Map _config;

  Configurator(String filePath) {
    _config = _loadYamlFileSync(filePath);
  }

  Map _loadYamlFileSync(String path) {
    File file = new File(path);
    String content = file.readAsStringSync();
    return loadYaml(content);
  }

  get port => _config['port'];
  get uidLength => _config['length'];
  get uidAlphabet => _config['alphabet'];
}
