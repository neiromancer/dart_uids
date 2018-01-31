import 'package:dart_uids/config.dart';
import 'dart:math';

/// Генератор уникальных идентификаторов
class UidGenerator {
  /// Текущая конфигурация
  static Config config = Config.instance();

  /// Генерирует uid
  ///
  /// Возвращает значение uid на основе значения текущего времени
  String generate() {
    //Делаем проверку на возможность генерации с задаными параметрами
    if (pow(config.uid.alphabet.length, config.uid.length) < 1829088000) {
      throw new StateError('Wrong configuration parameters');
    }

    //Находим разницу между текущей датой и 01.01.2018 в секундах
    int difference = new DateTime.now()
        .difference(new DateTime.utc(2018, DateTime.JANUARY, 1))
        .inSeconds;

    //Полученную разницу в секундах переводим в систему счисления с основанием N
    String uid = difference.toRadixString(config.uid.alphabet.length);

    //Добавляем нули впереди до необходимой длины
    while (uid.length < config.uid.length) {
      uid = '0' + uid;
    }
    return (uid.toUpperCase());
  }
}
