class ServerConfig {
  static const DEFAULT_PORT = 7777;
  static const DEFAULT_HOST = '127.0.0.1';

  int _port;
  String _host;

  ServerConfig(Map server) {
    if (server != null) {
      if (server.containsKey('port')) {
        if (server['port'] is num &&
            server['port'] > 0 &&
            server['port'] < 65535)
          _port = server['port'];
        else
          print('incorrect port');
      }
      if (server.containsKey('host')) {
        if (server['host'] is String)
          _host = server['host'];
        else
          print('incorrect host');
      }
    }
  }

  get port => _port == null ? DEFAULT_PORT : _port;
  get host => _host == null ? DEFAULT_HOST : _host;
}
