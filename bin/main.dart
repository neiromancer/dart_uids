import 'package:dart_uids/config.dart';
import 'package:dart_uids/uid_server.dart';

void main() {
  Config.instance().load('config.yaml');
  final UidServer server = new UidServer();
  server.start();
}
