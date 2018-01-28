import 'dart:io';
import 'dart:async';
import '../bin/uid_server.dart';
import 'package:test/test.dart';
import 'dart:convert';
import 'package:dart_uids/config.dart';

Future main() async {
  final server = new UidServer();
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
    HttpClientRequest request = await client.get(
      config.host, 
      config.port, 
      '/');
    HttpClientResponse response = await request.close();

    // чтение ответа сервера
    String value = await response.transform(UTF8.decoder).first;
    client.close();

    // сравнение ответа сервера с регулярным выражением
    expect(value.contains(new RegExp(r'\w{6}')), equals(true));
  });
}