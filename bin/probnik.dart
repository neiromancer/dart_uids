import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;



var url = "http://192.168.251.17:42001/";

http.read(url).then((res){ print(res); });