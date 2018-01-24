import 'dart:io';
import 'dart:async';
import '../bin/uuid_http_server.dart';
import 'package:test/test.dart';
import 'dart:convert';



Future main() async {

  final server = new UuidHttpServer();
  setUpAll(() async {
    await server.start();
  });
  tearDownAll(() async {
    await server.stop();
  });
  test('Request to Server', () async {
    var client = new HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse('http://127.0.0.1:4040/'));
    HttpClientResponse response = await request.close();
    String value = await response.transform(UTF8.decoder).first;
    client.close();
          expect(value, equals('SomeUUID'));
    });
 
}