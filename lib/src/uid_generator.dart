import 'package:dart_uids/config.dart';
import 'dart:math';

/// Генератор уникальных идентификаторов
class UidGenerator {
  /// Текущая конфигурация
  static Config config = Config.instance();

  /// Исходный алфавит
  static final List<String> defaultAlph =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  /// Заданный в конфигурации алфавит
  static List<String> specifiedAlph;

  /// Конструктор
  ///
  /// Делает проверку на возможность генерации с задаными параметрами
  UidGenerator() {
    if (pow(config.uid.alphabet.length, config.uid.length) < 1829088000) {
      throw new StateError('Wrong configuration parameters');
    }
    specifiedAlph = config.uid.alphabet.split('');
  }

  /// Генерирует uid
  ///
  /// Возвращает значение uid на основе значения текущего времени
  String generate() {
    //Находим разницу между текущей датой и 01.01.2018 в секундах
    int difference = new DateTime.now()
        .difference(new DateTime.utc(2018, DateTime.JANUARY, 1))
        .inSeconds;

    //Полученную разницу в секундах переводим в систему счисления с основанием N
    String uid =
        difference.toRadixString(config.uid.alphabet.length).toUpperCase();

    //Добавляем нули впереди до необходимой длины
    while (uid.length < config.uid.length) uid = '0' + uid;

    //Маппинг
    String result = '';
    for (String char in uid.split('')) {
      result += specifiedAlph[defaultAlph.indexOf(char)];
    }
    return (result);
  }
}
