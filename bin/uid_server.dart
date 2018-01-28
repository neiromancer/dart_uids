import 'dart:io';
import 'dart:async';
import 'package:dart_uids/config.dart';
import 'package:dart_uids/src/uid_generator.dart';

class UidServer {
  // обращение к генератору
  String uid = new UidGenerator().generate();

  // обращение к конфигу
  var config = Config.instance().server;
  HttpServer _server;

  Future start() async {
    // запуск сервера по команде диспетчера
    _server = await HttpServer.bind(
      config.host,
      config.port,
    );
    //отчет в консоль о успешном запуске и актуальном адрес:порт
    print('Listening on ${_server.address}:${_server.port}');

    // обработка запроса к серверу
    _server.listen((request) {
      //преверка запроса на валидность
      if (request.method == 'GET' && request.uri.path == "/") {
        // на валидные запросы ответ UID
        request.response.write(uid);
      } else {
        // на плохие запросы ответ bad request
        request.response.statusCode = HttpStatus.BAD_REQUEST;
      }
      //закрытие ответа
      request.response.close();
    });
  }

  Future stop() async {
    // остановка сервера по команде от диспетчера
    await _server.close();
  }
}
