import 'package:test/test.dart';
import '../lib/config.dart';

void main() {
  test('port getter', () {
    Config config = new Config('test/config.yaml');
    expect(config.server.port, 3000);
  });

	test('host getter', () {
    Config config = new Config('test/config.yaml');
    expect(config.server.host, '127.0.0.1');
  });

  test('uid length getter', () {
    Config config = new Config('test/config.yaml');
    expect(config.uid.length, 6);
  });

  test('alphabet getter', () {
    Config config = new Config('test/config.yaml');
    expect(config.uid.alphabet, '0123456789ABCDEFGHIJKLMNPQRSTUVWZYX');
  });
}
