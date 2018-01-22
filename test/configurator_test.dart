import 'package:test/test.dart';
import '../lib/configurator.dart';

void main() {
  test('port getter', () {
    Configurator config = new Configurator('test/config.yaml');
    expect(config.port, 3000);
  });

  test('uid length getter', () {
    Configurator config = new Configurator('test/config.yaml');
    expect(config.uidLength, 6);
  });

  test('alphabet getter', () {
    Configurator config = new Configurator('test/config.yaml');
    expect(config.uidAlphabet, '0123456789ABCDEFGHIJKLMNPQRSTUVWZYX');
  });
}
