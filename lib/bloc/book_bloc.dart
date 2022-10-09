import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tarea3/bookItem.dart';
import 'package:tarea3/http_books.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  bool fullText = false;
  // Map<String, dynamic>? books;
  BookBloc() : super(BookInitial()) {
    on<GetBookEvent>(_getBooks);
  }

  List<BookItem> bookList = <BookItem>[];

  Future<dynamic> searchBooks(bookNames) async {
    bookList.clear();

    try {
      var response = await HttpBooks().postRequest(bookNames);

      if (response.statusCode == HttpStatus.ok) {
        var booksJson = jsonDecode(response.body);

        print(booksJson);

        for (var item in booksJson['items']) {
          bookList.add(BookItem.fromJson(item));
        }

        return true;
      } else {
        return false;
        // throw Exception('Not Found');
      }
    } catch (e) {
      // throw Exception('Error de servidor');
      return false;
    }
  }

  Future<void> _getBooks(event, emit) async {
    emit(GetBookLoadingState());

    var infoBooks = await searchBooks(event.bookName);
    print(infoBooks);

    if (infoBooks == true) {
      emit(GetBookSuccessState());
    } else {
      emit(GetBookErrorState(error: 'Error'));
    }
  }
}

