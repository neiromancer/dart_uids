import 'package:test/test.dart';
import '../lib/config.dart';

void main() {
  Config config;
  setUpAll(() => config = new Config('test/config.yaml'));

  test('port getter', () {
    expect(config.server.port, 3000);
  });

  test('host getter', () {
    expect(config.server.host, '127.0.0.1');
  });

  test('uid length getter', () {
    expect(config.uid.length, 6);
  });

  test('alphabet getter', () {
    expect(config.uid.alphabet, '0123456789ABCDEFGHIJKLMNPQRSTUVWZYX');
  });

  test('incomplete config', () {
    Config incomplete = new Config('test/incomplete.yaml');
    expect(incomplete.server.port, 7777);
    expect(incomplete.server.host, '127.0.0.1');
    expect(incomplete.uid.length, 6);
    expect(incomplete.uid.alphabet, '0123456789ABCDEFGHIJKLMNPQRSTUVWZYX');
  });

  test('incorrect config', () {
    Config incorrect = new Config('test/incorrect.yaml');
    expect(incorrect.server.port, 7777);
    expect(incorrect.server.host, '127.0.0.1');
    expect(incorrect.uid.length, 6);
    expect(incorrect.uid.alphabet, '0123456789ABCDEFGHIJKLMNPQRSTUVWZYX');
  });

  test('file system exception', () {
    expect(() {
      new Config('test/konfig.yaml');
    }, prints('FileSystemException\n'));
  });

  test('config format', () {
    expect(() {
      new Config('test/config.yam');
    }, prints('StateError\n'));
  });
}
