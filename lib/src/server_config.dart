class ServerConfig{
	int _port;
	String _host;

	ServerConfig(Map server){
		_port = server['port'];
		_host = server['host'];
	}

	get port => _port;
	get host => _host;
}