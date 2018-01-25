class UIDConfig {
  static const DEFAULT_LENGTH = 6;
  static const DEFAULT_ALPHABET = '0123456789ABCDEFGHIJKLMNPQRSTUVWZYX';

  int _length;
  String _alphabet;

  UIDConfig(Map uid) {
    if (uid != null) {
      if (uid.containsKey('length')) {
        if (uid['length'] is num)
          _length = uid['length'];
        else
          print('incorrect uid length');
      }
      if (uid.containsKey('alphabet')) {
        if (uid['alphabet'] is String)
          _alphabet = uid['alphabet'];
        else
          print('incorrect uid alphabet');
      }
    }
  }

  get length => _length == null ? DEFAULT_LENGTH : _length;
  get alphabet => _alphabet == null ? DEFAULT_ALPHABET : _alphabet;
}
