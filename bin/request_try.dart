import 'dart:async';
import 'dart:io';
import 'dart:convert';


/* void main() {
  HttpClient client = new HttpClient();
    client.getUrl(Uri.parse("http://ipecho.net/plain"))
      .then((HttpClientRequest request) {
      return request.close();
    })
    .then((HttpClientResponse response) {
    response.transform(UTF8.decoder).listen((value){print(value);});
    });
} */
Future main() async {
  var client = new HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse('http://ipecho.net/plain'));
  HttpClientResponse response = await request.close();
    String value = await response.transform(UTF8.decoder).first;
    client.close();
    print(value);
    //listen((value){print(value);});
}


