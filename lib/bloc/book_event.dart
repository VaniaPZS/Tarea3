part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class GetBookEvent extends BookEvent {
  final String bookName;

  GetBookEvent({required this.bookName});


  @override
  List<Object> get props => [bookName];
}

class ShowAllLinesEvent extends BookEvent {

}