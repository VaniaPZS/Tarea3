part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class GetBookSuccessState extends BookState {

  @override
  List<Object> get props => [];
}

class GetBookErrorState extends BookState {
  final String error;

  GetBookErrorState({required this.error});
}

class GetBookLoadingState extends BookState {}
