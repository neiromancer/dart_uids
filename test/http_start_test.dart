import 'dart:io';
import 'dart:async';
import '../bin/http_srv.dart';
import 'package:test/test.dart';
import 'dart:convert';



Future main() async {

  final server = new httpServer();
  setUpAll(() async {
    await server.start();
  });
  tearDownAll(() async {
    await server.stop();
  });
  test('Request to Server', () async {
    var client = new HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse('http://ipecho.net/plain'));
    HttpClientResponse response = await request.close();
    String value = await response.transform(UTF8.decoder).first;
    client.close();
    expect(value, equals('185.31.164.244'));
    });
 
}