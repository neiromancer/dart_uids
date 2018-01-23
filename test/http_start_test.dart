import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../bin/http_srv.dart';



void main() {

  final server = new httpServer();
  await server.start();

/*   test('Server sucsess start',() {
    expect(... , prints('Listen adress on 8080'));
  }); */

  test('HTTP response',() {
    expect(... , HttpRequest.request('/', method: 'GET', );
  });

  await server.stop();
}