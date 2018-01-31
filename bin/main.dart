import 'package:dart_uids/config.dart';
import 'package:dart_uids/uid_server.dart';

void main() {
  final config = Config.instance().load('config.yaml');
  final UidServer server =
      new UidServer(config.server.host, config.server.port);
  server.start();
}
