import 'dart:io';
import 'dart:async';

class UuidHttpServer {

    HttpServer _server;

    Future start() async {
      _server = await HttpServer.bind(
      InternetAddress.ANY_IP_V4,
      4040,
     );
    print('Listening on localhost:${_server.port}');

    _server.listen((request) {
      request.response.write('SomeUUID');
      request.response.close();
      }
    );
    }

    Future stop() async {

    await _server.close();

    }
}

