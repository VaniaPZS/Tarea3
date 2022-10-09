class BookItem {
  String titulo;
  String fechaPublicacion;
  String descripcion;
  String longitud;
  String urlImage;
  String urlPreview;

  BookItem({
    required this.titulo,
    required this.fechaPublicacion,
    required this.descripcion,
    required this.longitud,
    required this.urlImage,
    required this.urlPreview,
  });

  factory BookItem.fromJson(Map<String, dynamic> jsonBook) {
    var _titulo = '-';
    try {
      _titulo = jsonBook['volumeInfo']['title'];
    } catch (e) {}

    var _fechaPublicacion = '-';
    try {
      _fechaPublicacion = jsonBook['volumeInfo']['publishedDate'];
    } catch (e) {}

    var _descripcion = '-';
    try {
      _descripcion = jsonBook['volumeInfo']['description'];
    } catch (e) {}

    var _longitud = '-';
    try {
      _longitud = '${jsonBook['volumeInfo']['pageCount']}';
    } catch (e) {}

    var _urlImage =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Closed_Book_Icon.svg/1200px-Closed_Book_Icon.svg.png';
    try {
      _urlImage = jsonBook['volumeInfo']['imageLinks']['thumbnail'];
    } catch (e) {}

    var _urlPreview = 'https://books.google.com.mx/';
    try {
      _urlPreview = jsonBook['volumeInfo']['previewLink'];
    } catch (e) {}

    return BookItem(
        titulo: _titulo,
        fechaPublicacion: _fechaPublicacion,
        descripcion: _descripcion,
        longitud: _longitud,
        urlImage: _urlImage,
        urlPreview: _urlPreview);
  }
}

BookItem defaultBook = BookItem(
    titulo:
        'Harry Potter y la piedra filosofal sdfasdf asdf asdf as asasda asdfafasf asdf as',
    fechaPublicacion: 'publishedDate',
    descripcion: 'description',
    longitud: 'pageCount',
    urlImage:
        "http://books.google.com/books/content?id=p3QQjwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
    urlPreview:
        "http://books.google.com.mx/books?id=p3QQjwEACAAJ&dq=harry+potter+inauthor:rowling&hl=&cd=1&source=gbs_api");
