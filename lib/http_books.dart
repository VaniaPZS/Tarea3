
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class HttpBooks {
  static final HttpBooks _httpBooks = HttpBooks._internal();

  factory HttpBooks() {
    return _httpBooks;
  }

  HttpBooks._internal();

  Future<Response> postRequest(bookName) async {
    return await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=' + bookName),
    );
  }
}
