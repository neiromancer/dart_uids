import 'package:test/test.dart';
import 'package:dart_uids/src/uid_generator.dart';

void main() {
  // Проверка генеатора без параметров
  test('Generate 6 symbols uid test', () {
    String ft = '6symb.';
    expect(new UidGenerator().generate().length, equals(ft.length));
  });

  test('Correct translation', () {
    String r = new UidGenerator().generate();
    r = r.replaceAll('Z', 'O');
    int k = int.parse(r, radix: 35);
    int e = new DateTime.now()
        .difference(new DateTime.utc(2018, DateTime.JANUARY, 1))
        .inSeconds;
    expect(k, equals(e));
  });
}
