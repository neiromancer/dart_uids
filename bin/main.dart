import 'package:dart_uids/config.dart';
import 'package:dart_uids/uid_server.dart';

void main() {
  final Config = Config.instance().load('config.yaml');
  final UidServer server = new UidServer( Config.server.host, Config.server.port );
  server.start();
}

