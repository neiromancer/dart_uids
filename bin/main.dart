import 'package:dart_uids/src/uid_generator.dart';


void main(List<String> arguments) {
  // Генерируем uid
  String uid = new UidGenerator().generate();

  print(uid);
}
