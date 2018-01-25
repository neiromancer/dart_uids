class UidGenerator {
  //На вход можно передать алфавит, если он не задан, генератор будет работать на стандартных  параметрах
  String generate([String alf]) {
    int n;
    if (alf != null) {
      n = alf.length;
    } else {
      n = 35;
    }
    ;
//Находим разницу между текущей датой и 01.01.2018 в секундах
    int difference = new DateTime.now()
        .difference(new DateTime.utc(2018, DateTime.JANUARY, 1))
        .inSeconds;
//Полученную разницу в секундах переводим в систему счисления с основанием N
    String kk = difference.toRadixString(n);

/* При работе со стандартным алфавитом(вызов без аргументов):
- меняем все О на Z;
- выполняем условие длины в 6 символов;
иначе меняем все символы, на заданные в алфавите */
    if (alf == null) {
      kk = kk.toUpperCase().replaceAll('O', 'Z');
      while (kk.length < 6) {
        kk = '0' + kk;
      }
      ;
    } else {
      for (int i = 0; i < n; i++) {
        kk = kk.replaceAll(i.toRadixString(n), alf[i]);
      }
    }
    return (kk);
  }
}
