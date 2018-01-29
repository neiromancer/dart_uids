import 'package:dart_uids/config.dart';
import 'package:dart_uids/uid_server.dart';

void main() {
  final _config = Config.instance().load('config.yaml');
  final UidServer server = new UidServer( _config.server.host, _config.server.port );
  server.start();
}

