import 'dart:io';
import 'dart:async';
import '../lib/uid_server.dart';

import 'package:test/test.dart';
import 'dart:convert';
import 'package:dart_uids/config.dart';

Future main() async {
  var _config = Config.instance().server;
  final server = new UidServer(_config.host, _config.port);
  setUpAll(() async {
    await server.start();
  });
  tearDownAll(() async {
    expect(server.stop(), completes);
  });
  test('Request to Server', () async {
    // создание нового клиента
    var client = new HttpClient();

    // чтение актуального порта и адреса из конфига запуска сервера
    var config = Config.instance().server;

    // отправка запроса
    HttpClientRequest request = await client.get(config.host, config.port, '/');
    HttpClientResponse response = await request.close();

    // чтение ответа сервера
    String value = await response.transform(UTF8.decoder).first;
    client.close();

    // сравнение ответа сервера с регулярным выражением
    expect(value.contains(new RegExp(r'\w{6}')), equals(true));
  });
}
