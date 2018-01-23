class UIDConfig{
	int _length;
	String _alphabet;

	UIDConfig(Map uid){
		_length = uid['length'];
		_alphabet = uid['alphabet'];
	}

	get length => _length;
	get alphabet => _alphabet;
}